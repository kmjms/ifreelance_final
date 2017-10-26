# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# pruebasree
Client.create(email:"client@test.com",password:"123456")
Freelance.create(email:"ree@test.com",password:"123456")
Type.create(name:"prueba",description:"tipo de prueba")
State.create(name:"prueba",description:"estado de prueba")
Project.create(name:"proj prueba",description:"projecto prueba",client_id:"1",freelance_id:"1",state_id:"1",type_id:"1",total_price:"150.000")
