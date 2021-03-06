require 'faker'

# Studio
 Studio.delete_all
studio = Studio.create!(
  city: 'Durham',
  email: 'test@studiojoy.net',
  name: 'Round One ',
  phone: '(555) 555-5555',
  state: 'NC',
  street_address: 'CC La Torre',
  zip: Faker::Address.zip,
  time_zone: Time.zone.name
)
# studio = Studio.first
puts 'Studio created'

# Users
User.delete_all
 4.times do User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone: '(555) 555-5555',
  email: Faker::Internet.email,
  password: 'password',
  studio_id: studio.id
)
end

puts "#{User.count} users created"

# Klasses
Klass.delete_all
klasses = ['Expert Class', 'Intermediate Class', 'Open Class']
klasses.each do |klass|
  Klass.create!(
    day_of_week: Date::DAYNAMES[Random.new.rand(0..6)],
    class_time: Time.at(Time.now.to_i - (Time.now.to_i % 15.minutes)),
    name: klass,
    recurring: true,
    studio_id: studio.id
  )
end
puts "#{Klass.count} klasses created"

Levels
Level.delete_all
levels = ['Beginner', 'Master']
levels.each do |level|
  Level.create!(
    name: level,
    color: "##{Faker::Number.hexadecimal(6)}",
    studio_id: studio.id
  )
end
puts "#{Level.count} levels created"

# Sources
Source.delete_all
sources = ['Facebook', 'Walk In', 'Referal']
sources.each do |source|
  Source.create!(
    name: source,
    studio_id: studio.id
  )
end
puts "#{Source.count} sources created"

# Accounts
Account.delete_all

# Visits
Visit.delete_all

# Payments
Payment.delete_all

# Members
Member.delete_all
20.times do
  Member.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: '(555) 555-5555',
    city: Faker::Address.city,
    state: Faker::Address.state,
    street_address: Faker::Address.street_address,
    zip: Faker::Address.zip,
    birthday: Faker::Date.birthday,
    active: [true, false].sample,
    start_date: Date.current,
    end_date: Date.current >> 12,
    membership_type: 'monthly',
    membership_price: 65.00,
    studio_id: studio.id,
    level_id: [1, 2].sample,
    source_id:  [1..3].sample
  )
end
puts "#{Member.count} members created"
