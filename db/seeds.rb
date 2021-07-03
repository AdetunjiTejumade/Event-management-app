# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(name: 'Lester party', description: 'Lester is celebrating his graduation', location: 'no-where',
             start_date: '14-2-2021', end_date: '15-2-2021', start_time: "22:35", end_time: "23:35", paid: false, user_id: 1)
