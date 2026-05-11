# frozen_literals: true

class User < ApplicationRecord
  LOCKED_STATUS_CODE = "locked"
  ACTIVE_STATUS_CODE = "active"

  has_secure_password

  has_many :user_sessions, dependent: :destroy
  belongs_to :member

  normalizes :email, with: ->(e) { e.strip.downcase }

  def status
    if locked_at.present?
      LOCKED_STATUS_CODE
    else
      ACTIVE_STATUS_CODE
    end
  end
end
