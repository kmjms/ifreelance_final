# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# pruebasree


Freelance.create(email:"free@test.com",password:"123456",username:'AdminFreelance')

Freelance.find(1).clients.create(email:"jgarzonj@unal.edu.co",password:"123456",username:'julian_cliente')
#Freelance.find(1).clients.create(email:"jgarzonj@unal.edu.co",password:"123456",username:'julian_cliente')

Type.create(name:"Cotizacion",description:"tipo de prueba")
Type.create(name:"Diseño",description:"tipo de prueba")
Type.create(name:"Desarrollo",description:"tipo de prueba")
Type.create(name:"Pruebas",description:"tipo de prueba")
Type.create(name:"Implementacion",description:"tipo de prueba")

State.create(name:"prueba",description:"estado de prueba")
Project.create(name:"proj prueba",description:"projecto prueba",client_id:"1",freelance_id:"1",state_id:"1",type_id:"1",total_price:"150.000")
