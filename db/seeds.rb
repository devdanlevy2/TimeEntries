# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Developer.create!(name: "daniel", email: "daniel@gmail.com", password: "password")
TimeEntry.create!(project_id: 1, developer_id: 1, duration: 2, date_on: 2016-03-04 )
Project.create!(name: "DeCode DaVinci", max_hours: 2000)

Developer.create!(name: "mike", email: "mike@gmail.com", password: "password")
TimeEntry.create!(project_id: 3, developer_id: 2, duration: 2, date_on: 2016-03-04 )
Project.create!(name: "Clean up Gulf Coast", max_hours: 1000)
