# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
Priority.delete_all

user1 = User.create( :first => 'hal', :last => 'jordan', :username => 'haljordan', :email => 'haljordan@gmail.com', :password => 'x', :password_confirmation => 'x')

p1 = Priority.create( :title => 'high', :level => 1, :color => '#efefef' )
p2 = Priority.create( :title => 'medium', :level => 2, :color => '#aaa' )
p3 = Priority.create( :title => 'low', :level => 3, :color => '#ccc' )

t1 = Task.create( :name => 'task 1' )
t2 = Task.create( :name => 'task 2' )
t3 = Task.create( :name => 'task 3' )
t4 = Task.create( :name => 'task 4' )

user1.priorities = [p1, p2, p3]
user1.tasks = [t1, t2, t3, t4]
p1.tasks = [t1, t2]
p2.tasks << t3
p3.tasks << t4