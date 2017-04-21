# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
band1 = Band.create(name: "Red Hot Chili Peppers")
band2 = Band.create(name: "The Beatles")
band3 = Band.create(name: "NWA")

Album.destroy_all
album1 = Album.create(title: "Californication",  band_id: band1.id, album_type: "Studio")
album2 = Album.create(title: "Live from THE STADIUM",  band_id: band1.id, album_type: "Live")

Track.destroy_all
track1 = Track.create(title: "Otherside", album_id: album1.id, track_type: "Regular")
track2 = Track.create(title: "Around the World", album_id: album1.id, track_type: "Regular")
