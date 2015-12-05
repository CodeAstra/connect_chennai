# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LOCALITY_DATA = [
  {name: "Adyar", position: "13.0063142,80.2417759"}
];

LOCALITY_DATA.each do |data|
  Locality.find_or_create_by(name: data[:name]) do |locality|
    locality.latitude, locality.longitude = data[:position].split(",")
  end
end
