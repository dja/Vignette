# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	Customer.create(name: "Daniel", rating: 4, location: "Newport Beach")
	Customer.create(name: "Nick", rating: 5, location: "Santa Monica")
	c = Customer.create(name: "Sylvia", rating: 5, location: "Santa Monica")

	p = Photographer.create(name: "Vishnu", location: "New York City", available: true )

	a = Album.create(name: "Europe Trip", photographer: p, customer: c, location: "Paris, France")
	Photo.create(album: a)