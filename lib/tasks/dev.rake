namespace :dev do
  desc "Dev Environment Settings"
  task setup: :environment do

    puts "Restart DataBase..."
    %x(rails db:drop db:create db:migrate)

    puts "Generating Contacts Types..."

    kinds = %w(Friend Familiar Commercial)
    kinds_created = kinds.map do |kind|
      Kind.create!(description: kind)
    end
    
    puts "Contacts Type populated with success!"

    ###

    puts "Generating Contacts..."
    
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 75.years.ago, to: 18.years.ago),
        kind_id: kinds_created.sample.id
      )
    end
    
    puts "Contacts populated with success!"

    ###

    puts "Generating Phones..."
    
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone, contact: contact)
      end
    end
    
    puts "Phones populated with success!"

    ###

    puts "Generating address..."
    
    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    
    puts "Address populated with success!"

  end
end
