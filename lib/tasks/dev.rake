namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    p 'Reset database'
    %x(rails db:drop db:create db:migrate)

    p 'Add kinds...'
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    p 'Kinds added'
    
    p 'Add contacts...'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    p 'Contacts added'   
    
    p 'Add phones'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    p 'Phones added'

    p 'Add addresses'
    Contact.all.each do |contact|
      Address.create(street: Faker::Address.street_address, city: Faker::Address.city, contact: contact )
    end
    p 'Addresses added'   
  end
end
