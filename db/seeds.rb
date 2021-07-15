# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!  :email => 'admin@admin.com', :password => 'admin@123', :password_confirmation => 'admin@123', :role => 0
user = User.create! :fname => 'Tester', :lname => '1', :dob => '17/12/1997', :phone => '17617232', :designation => 'Teacher', :address => 'Babesa, Thimphu', :email => 'tester1@gmail.com', :password => 'test@123', :password_confirmation => 'test@123', :role => 2
