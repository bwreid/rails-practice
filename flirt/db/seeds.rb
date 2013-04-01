# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Administrator.delete_all
Subscriber.delete_all
Subscription.delete_all

subscriber = Subscriber.create( tagline: 'all your base are belong to us', bio: 'beep beep boop', gender: 'superhuman', age: 25 )
user =  User.create( email: 'x@gmail.com', username: 'x', password: 'x', password_confirmation: 'x' )
subscriber.user = user

super_user =  User.create( email: 'super@gmail.com', username: 'super', password: 'x', password_confirmation: 'x' )
admin = Administrator.create( role: 'Super Admin' )
admin.user = super_user

Subscription.create( plan: 'Free', duration: 0, cost: 0.00 )
s1 = Subscription.create( plan: 'Basic', duration: 30, cost: 1.00 )
Subscription.create( plan: 'Premium', duration: 30, cost: 5.00 )

payer = Subscriber.create( tagline: 'all your base are belong to us', bio: 'beep beep boop', gender: 'superhuman', age: 25 )
user =  User.create( email: 'y@gmail.com', username: 'y', password: 'y', password_confirmation: 'y' )
payer.user = user
payer.subscription = s1
payer.save