# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Foo Bar",
             email: "foo.bar@umontpellier.fr",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

Course.create!(name: "Algo",
               description: "Cest coeff 8 alors bosse !")

Course.create!(name: "Compilation",
               description: "Le mips c'est pas si dur.")

Course.create!(name: "Compta",
               description: "416 client douteux")

20.times do |n|
  name  = Faker::Lorem.word
  description = Faker::Lorem.sentences
  Course.create!(name: name,
                 description: description)
end

