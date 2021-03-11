# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Property.destroy_all

puts 'Creating 4 new Users'
emails = ["alston@gmail.com", "matheus@gmail.com", "david@gmail.com"]
titles = ["Big Blue House", "Nice and Spacious", "Luxury Home", "Cheap Offer", "Newst Rebuilt"]


3.times do 
    user = User.new(
        first_name: ["Alston", 'Matheus', 'David'].sample,
        last_name: ["Cobb", "Lopes", 'Lugo'].sample,
        phone: rand(99123456..10000000),
        email: emails.pop,
        year_born: rand(1980..2000),
        gender: ["M", 'F'].sample,
        password: "123456"
    )
    user.save! 
end
puts "Finished Users"

puts 'Creating 10 new Properties'

10.times do 
    
    property = Property.new(

    user_id: User.all.sample.id,
    price: rand(100000..1000000),
    address: ["Quito, Ecuador", "Guayas, Ecuador", "Quevedo, Ecuador", "Sucumbios, Ecuador"].sample,
    city: ["Quito", 'Manabi', 'Guayaquil', 'Loja'].sample,
    zip_code: rand(170700..170900),
    neighborhood_info: "Lovely parks and churches around with a private school",
    neighborhood: "Metropolitano",
    sq_meters: rand(500..1000),
    bedrooms: rand(2..7),
    bathrooms: rand(2..7),
    sq_meters_land: rand(5000..20000),
    year_bought: rand(2000..2020),
    price_bought: rand(100000..800000),
    sq_meters_added: rand(0..300),
    year_built: rand(1990..2019),
    year_renovated: rand(2000..2020),
    beachfront: [false, true].sample,
    waterfront: [false, true].sample,
    pool: [false, true].sample,
    propery_type: ["Condo", 'House', "Apartment", 'Town House'].sample,
    central_air: [false, true].sample,
    dishwasher: [false, true].sample,
    washing_machine: [false, true].sample,
    attached_garage: [false, true].sample,
    title: titles.sample
    )
    property.save!
end
puts "Finished Properties"