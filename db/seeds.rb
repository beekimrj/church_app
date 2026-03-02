# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."

AttendanceMember.delete_all
Attendance.delete_all
Event.delete_all
ChurchService.delete_all
Member.delete_all

puts "Creating Church Services..."

sunday_service = ChurchService.create!(
  name: "Sunday Adult Service",
  code: "SAS",
  status: "active"
)

sunday_school = ChurchService.create!(
  name: "Sunday School",
  code: "SS",
  status: "active"
)

mens_group = ChurchService.create!(
  name: "Men's Fellowship",
  code: "MEN",
  status: "active"
)

womens_group = ChurchService.create!(
  name: "Women's Fellowship",
  code: "WOM",
  status: "active"
)

puts "Creating Events..."

regular_sunday = Event.create!(
  name: "Regular Sunday Service",
  status: "active",
  start_date: Date.new(2026, 1, 1),
  end_date: Date.new(2026, 12, 31),
  church_service: sunday_service,
  code: "RSS2026",
  description: "Weekly worship service",
  recurrence: "weekly",
  default_start_time: "10:00",
  default_end_time: "12:00",
  capacity: 300
)

sports_day = Event.create!(
  name: "Sports Day",
  status: "active",
  start_date: Date.new(2026, 4, 10),
  end_date: Date.new(2026, 4, 12),
  church_service: sunday_school,
  code: "SD2026",
  description: "Annual church sports event",
  recurrence: "yearly",
  default_start_time: "09:00",
  default_end_time: "15:00",
  capacity: 150
)

mens_prayer = Event.create!(
  name: "Monthly Men's Prayer",
  status: "active",
  start_date: Date.new(2026, 1, 1),
  end_date: Date.new(2026, 12, 31),
  church_service: mens_group,
  code: "MP2026",
  description: "Monthly prayer meeting",
  recurrence: "monthly",
  default_start_time: "18:30",
  default_end_time: "20:00",
  capacity: 50
)

puts "Creating Members..."

members = []

members_data = [
  ["John", "Smith", "0411000001", "john@example.com"],
  ["Mary", "Smith", "0411000002", "mary@example.com"],
  ["David", "Johnson", "0411000003", "david@example.com"],
  ["Sarah", "Johnson", "0411000004", "sarah@example.com"],
  ["Michael", "Brown", "0411000005", "michael@example.com"],
  ["Emma", "Brown", "0411000006", "emma@example.com"],
  ["Daniel", "Williams", "0411000007", "daniel@example.com"],
  ["Olivia", "Williams", "0411000008", "olivia@example.com"],
  ["James", "Taylor", "0411000009", "james@example.com"],
  ["Sophia", "Taylor", "0411000010", "sophia@example.com"],
  ["Matthew", "Anderson", "0411000011", "matthew@example.com"],
  ["Isabella", "Anderson", "0411000012", "isabella@example.com"],
  ["Joshua", "Thomas", "0411000013", "joshua@example.com"],
  ["Mia", "Thomas", "0411000014", "mia@example.com"],
  ["Andrew", "Moore", "0411000015", "andrew@example.com"],
  ["Charlotte", "Moore", "0411000016", "charlotte@example.com"],
  ["Ethan", "Martin", "0411000017", "ethan@example.com"],
  ["Amelia", "Martin", "0411000018", "amelia@example.com"],
  ["Benjamin", "Lee", "0411000019", "benjamin@example.com"],
  ["Harper", "Lee", "0411000020", "harper@example.com"]
]

members_data.each_with_index do |(first, last, phone, email), index|
  members << Member.create!(
    first_name: first,
    last_name: last,
    phone_number: phone,
    email: email,
    date_of_birth: Date.new(1990, 1, (index % 28) + 1),
    code: "MBR#{index + 1}",
    gender: index.even? ? "male" : "female",
    marital_status: index.even? ? "married" : "single",
    baptism_date: Date.new(2010, 6, 15)
  )
end

puts "Creating Attendances..."

attendance1 = Attendance.create!(
  event: regular_sunday,
  date: Date.new(2026, 1, 11),
  start_time: "10:00",
  end_time: "12:00",
  status: "completed",
  note: "First Sunday service of the year"
)

attendance2 = Attendance.create!(
  event: sports_day,
  date: Date.new(2026, 4, 10),
  start_time: "09:00",
  end_time: "15:00",
  status: "completed",
  note: "Sports Day - Day 1"
)

attendance3 = Attendance.create!(
  event: mens_prayer,
  date: Date.new(2026, 1, 15),
  start_time: "18:30",
  end_time: "20:00",
  status: "completed",
  note: "January prayer meeting"
)

puts "Creating Attendance Members..."

# Add first 15 members to Sunday service
members.first(15).each do |member|
  AttendanceMember.create!(
    attendance: attendance1,
    member: member,
    arrived_at: Time.zone.parse("2026-01-11 10:05"),
    departed_at: Time.zone.parse("2026-01-11 11:55"),
    note: "On time"
  )
end

# Add 10 members to Sports Day
members.first(10).each do |member|
  AttendanceMember.create!(
    attendance: attendance2,
    member: member,
    arrived_at: Time.zone.parse("2026-04-10 09:10"),
    departed_at: Time.zone.parse("2026-04-10 14:30"),
    note: "Participated in games"
  )
end

# Add 8 members to Men's Prayer
members.select { |m| m.gender == "male" }.first(8).each do |member|
  AttendanceMember.create!(
    attendance: attendance3,
    member: member,
    arrived_at: Time.zone.parse("2026-01-15 18:35"),
    departed_at: Time.zone.parse("2026-01-15 19:55"),
    note: "Prayer session"
  )
end

puts "Seeding completed successfully!"
