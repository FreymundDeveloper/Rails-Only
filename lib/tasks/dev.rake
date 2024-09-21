namespace :dev do
  desc "Dev Environment Settings"
  task setup: :environment do
    puts "Generating Contacts Types..."

    kinds = %w(Friend Familiar Commercial)
    kinds_created = kinds.map do |kind|
      Kind.create!(description: kind)
    end
    
    puts "Contacts Type populated with success!"

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
  end
end
