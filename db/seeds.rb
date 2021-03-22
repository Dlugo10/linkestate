require 'uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Property.destroy_all

puts 'Creating 3 new Users'

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
    property = Property.create!( # CREATE THE PRODUCT BEFORE LINKING WITH IMAGE
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
# AND HERE THE PATH TO THE IMAGE:
    url = [
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183774/LinkEstate/24928-malibu-road-malibu-ca-usa-8-EXT_dihtel_rieimx.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183773/LinkEstate/377bd27b5fa5fdb4b1cfc2b184b12a0b_bifofj_kuza7u.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183773/LinkEstate/2a97607762d7e25d2912096f4e0ab7b5_wkopzm.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183773/LinkEstate/3229-diamondhead-road-honolulu_202001716_0_b2lmvi_rfgsdi.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183772/LinkEstate/39a56d191ecc1673b30128f849b05d9c_oeydnl.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183771/LinkEstate/2ceadc8f60348103f2b4d3a2a7efd77a_i5mbdn.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183771/LinkEstate/5eb45660b80701127b59504daa72095b_g9tiwy.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183769/LinkEstate/p1-image_wergwu_lm8usq.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183768/LinkEstate/maxresdefault_ozlawe_wzkec9.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183768/LinkEstate/tribeca_flat_xaj2qy_htnmil.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183767/LinkEstate/moonves-house-1_aruduf_usqqrr.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183766/LinkEstate/image-18_rbmpv4.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183763/LinkEstate/Lanai_1800x1200_2020593-640x394_rdmpv3_aplcra.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904526/LinkEstate/fb447bb6547ef7928e50b2167483970f_j5tjhg.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183755/LinkEstate/house_5_lp4fa5_fdcyeg.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183757/LinkEstate/bungalowsM_slider_hwicja.jpg', 
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183758/LinkEstate/house_7_yfm836_gtjpis.jpg', 
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183758/LinkEstate/house_8_fuqwe0_pemjsu.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183758/LinkEstate/house_10_pdtsyx_qv30b1.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183758/LinkEstate/house_9_jou77h_pevidt.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183759/LinkEstate/house_ihbbue_pkrcy8.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183759/LinkEstate/house2_f4ujjv_czyjop.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183768/LinkEstate/tribeca_flat_exterior_gaau1d_cxz5e5.jpg'
    ].sample # IT CAN BE BUT IT DOESNT HAVE TO BE CLOUDINARY
    filename = File.basename(URI.parse(url).path)
    file = URI.open(url)
    property.photos.attach(io: file, filename: filename)

    url_2 = [
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904355/LinkEstate/beach-holiday-picture-id528910606_kxe26n.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904251/LinkEstate/download_odypn9.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904162/LinkEstate/istockphoto-1091875700-612x612_wlmll9.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904526/LinkEstate/fb447bb6547ef7928e50b2167483970f_j5tjhg.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904432/LinkEstate/farrington-600x450_pmkubk.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904436/LinkEstate/Lanai_1800x1200_2020593-640x394_rdmpv3.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904439/LinkEstate/denton_lan_night_gn4dae.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904444/LinkEstate/3229-diamondhead-road-honolulu_202001716_0_b2lmvi.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904450/LinkEstate/377bd27b5fa5fdb4b1cfc2b184b12a0b_bifofj.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904457/LinkEstate/maxresdefault_ozlawe.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904501/LinkEstate/imagereader.aspx_xs61ib.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1615904554/LinkEstate/10ff27d50d7813d503dfe0d7e226ec14_ononit.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183754/LinkEstate/26200927-formal-living_cover_2000x1333_jrvtqf.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183755/LinkEstate/bcf22a1aead09fa56f6898606df6c3b3_hzerkn.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183755/LinkEstate/bungalow_lizr1y_nacacg.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183757/LinkEstate/bung1-main_rmzpxi.jpg', 
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183755/LinkEstate/bungalow_3_fphmir_ym81mu.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183758/LinkEstate/denton_lan_night_gn4dae_zpr9hr.jpg',
        'https://res.cloudinary.com/atc5nc/image/upload/v1616183760/LinkEstate/farrington-600x450_pmkubk_po4wd2.jpg'
    ].sample # IT CAN BE BUT IT DOESNT HAVE TO BE CLOUDINARY
    filename_interior = File.basename(URI.parse(url_2).path)
    file_interior = URI.open(url_2)
    property.photos.attach(io: file_interior, filename: filename_interior)

    property.save!
end
puts "Finished Properties"

