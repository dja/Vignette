# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	User.create(name: "Daniel", rating: 4, location: "Newport Beach")
	User.create(name: "Nick", rating: 5, location: "Santa Monica")
	User.create(name: "Sylvia", rating: 5, location: "Santa Monica")

	Photographer.create(name: "Vishnu", location: "New York City", available: true )