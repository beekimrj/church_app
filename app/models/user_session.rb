# == Schema Information
#
# Table name: user_sessions
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  token        :string           not null
#  device_name  :string
#  ip_address   :string
#  user_agent   :string
#  last_used_at :datetime
#  expires_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_sessions_on_expires_at  (expires_at)
#  index_user_sessions_on_token       (token) UNIQUE
#  index_user_sessions_on_user_id     (user_id)
#

class UserSession < ApplicationRecord
  SESSION_ACTIVE_STATUS = "active"
  SESSION_INACTIVE_STATUS = "inactive"

  has_secure_token :token

  belongs_to :user

  scope :active, -> { where(expires_at: nil).or(where("expires_at > ?", Time.current)) }
  scope :inactive, -> { where(expires_at: ..Time.current) }
  scope :ordered, -> { order(Arel.sql("
    CASE
      WHEN expires_at IS NULL OR expires_at > NOW() THEN 0
      ELSE 1
    END
    "))
    .order(created_at: :desc)
  }

  def status
    if active?
      SESSION_ACTIVE_STATUS
    else
      SESSION_INACTIVE_STATUS
    end
  end

  def active?
    expires_at.blank? || expires_at > Time.current
  end

  def display_device_name
    return device_name if device_name.present?

    parse_device_name
  end

  private

  def parse_device_name
    ua = user_agent.to_s.downcase

    browser =
      if ua.include?("chrome")
        "Chrome"
      elsif ua.include?("firefox")
        "Firefox"
      elsif ua.include?("safari")
        "Safari"
      else
        "Browser"
      end

    platform =
      if ua.include?("iphone")
        "iPhone"
      elsif ua.include?("android")
        "Android"
      elsif ua.include?("mac os x")
        "Mac"
      elsif ua.include?("windows")
        "Windows"
      else
        "Device"
      end

    "#{browser} on #{platform}"
  end
end
