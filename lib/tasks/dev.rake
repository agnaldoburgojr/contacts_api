namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    p 'Add contacts...'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end
    p 'Contacts added'
  end

end
