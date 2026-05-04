FactoryBot.define do
  factory :user do
    email { "MyString" }
    encrypted_password { "MyString" }
    full_name { "MyString" }
    phone { "MyString" }
    reset_password_token { "MyString" }
    reset_password_sent_at { "2026-05-03 15:16:23" }
    confirmed_at { "2026-05-03 15:16:23" }
    confirmation_sent_at { "2026-05-03 15:16:23" }
    failed_attempts { "2026-05-03 15:16:23" }
    locked_at { "2026-05-03 15:16:23" }
  end
end
