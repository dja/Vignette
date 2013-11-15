# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	Customer.create(name: "Daniel", rating: 4, user_location: "Newport Beach")
	Customer.create(name: "Nick", rating: 5, user_location: "Santa Monica")
	c = Customer.create(name: "Sylvia", rating: 5, user_location: "Santa Monica")

	p = Photographer.create(name: "Vishnu", user_location: "New York City", available: true, meetup_location: "Brooklyn Bridge" )

	a = Album.create(name: "Europe Trip", photographer: p, customer: c, location: "Paris, France")
	Photo.create(album: a)