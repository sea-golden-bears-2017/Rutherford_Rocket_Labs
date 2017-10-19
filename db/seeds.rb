# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Warehouse.destroy_all
Employee.destroy_all

warehouse = Warehouse.create(city: "Seattle", location_code: "SEA-00000")
Warehouse.create(city: "Denver", location_code: "DEN-00000")
Warehouse.create(city: "Chicago", location_code: "CHI-00000")
Warehouse.create(city: "Portland", location_code: "POR-00000")

Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)
Employee.create(first_name: "Jules", last_name: "Dr", employee_id: 0001, password: "propulsion", is_manager: false, warehouse: warehouse)
