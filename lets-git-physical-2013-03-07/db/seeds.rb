# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Exercise.delete_all

user = User.create( :username => 'x', :password => 'x', :password_confirmation => 'x' )
user.exercises << Exercise.create( :activity => 'running', :unit => 'miles', :value => '3', :when_completed => '2013-03-08' )
user.exercises << Exercise.create( :activity => 'running', :unit => 'miles', :value => '4', :when_completed => '2013-03-10' )
user.exercises << Exercise.create( :activity => 'yoga', :unit => 'minutes', :value => '30', :when_completed => '2013-03-09' )
user.exercises << Exercise.create( :activity => 'yoga', :unit => 'minutes', :value => '45', :when_completed => '2013-03-11' )