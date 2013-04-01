# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Product.delete_all
Tag.delete_all

User.create( email: 'bwreid@gmail.com', password: 'x', password_confirmation: 'x', balance: 0.0, is_admin: false )
User.create( email: 'holla@bryanwreid.com', password: 'x', password_confirmation: 'x', balance: 0.0, is_admin: true )