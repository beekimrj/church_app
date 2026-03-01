FactoryBot.define do
  factory :attendance_member do
    member { nil }
    attendance { nil }
    arrived_at { "2026-03-01 23:45:45" }
    departed_at { "2026-03-01 23:45:45" }
    note { "MyString" }
  end
end
