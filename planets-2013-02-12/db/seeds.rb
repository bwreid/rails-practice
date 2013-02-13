# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Planet.delete_all

Planet.create(:name => 'Earth', :orbit => 1, :moons => 1)
Planet.create(:name => 'Mars', :orbit => 1.5, :moons => 2)
Planet.create(:name => 'Venus', :orbit => 0.7, :moons => 0)
Planet.create(:name => 'Jupiter', :orbit => 5.7, :moons => 3)
Planet.create(:name => 'Saturn', :orbit => 9.9, :moons => 1)