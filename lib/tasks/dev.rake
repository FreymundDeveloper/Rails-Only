namespace :dev do
  desc "Dev Environment Settings"
  task setup: :environment do
    puts "Generating Contacts..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 75.years.ago, to: 18.years.ago)
      )
    end
    
    puts "Contacts populate with success!"
  end

end
