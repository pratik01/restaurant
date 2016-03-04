# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
roles = Role.create([{id: 2,name: 'owner',title: 'owner'},{id: 3,name: 'customer',title: 'customer'},{id: 4,name: 'customer',title: 'staff-member'}])