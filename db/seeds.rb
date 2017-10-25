# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Part.destroy_all
# Employee.destroy_all
# Warehouse.destroy_all

warehouse = Warehouse.create(city: "Seattle", location_code: "SEA-00002")
Warehouse.create(city: "Denver", location_code: "DEN-00002")
Warehouse.create(city: "Chicago", location_code: "CHI-00002")
Warehouse.create(city: "Portland", location_code: "POR-00002")
Warehouse.create(city: "Phoenix", location_code: "PHO-00001")
Warehouse.create(city: "Williamsburg", location_code: "WIL-00001")
Warehouse.create(city: "Northport", location_code: "NOR-00001")


Employee.create(first_name: "Dr. Barnaby", last_name: "Van Nostram", employee_id: 1, password: "password", is_manager: true, warehouse: warehouse)
manager = Employee.create(first_name: "Dr", last_name: "Rutherford", employee_id: 0000, password: "commissioner", is_manager: true, warehouse: warehouse)
manager2 = Employee.create(first_name: "Manager Rubenstein", last_name: "Smith", employee_id: 0005, password: "rubes", is_manager: true, warehouse: warehouse)

Employee.create(first_name: "Jules", last_name: "Dr", employee_id: 0001, password: "propulsion", is_manager: false, warehouse: warehouse)

Part.create!(name: "o-ring", part_no: 35466, warehouse_id: 1, received_by_id: 2, removed: false)

1000.times { Part.create!(name: "beaker", part_no: 20001, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }
200.times { Part.create!(name: "thruster", part_no: 69021, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }
20.times { Part.create!(name: "fan", part_no: 86951, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }
20.times { Part.create!(name: "cooling unit", part_no: 45862, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }
20.times { Part.create!(name: "safety blanket", part_no: 35486, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }
20.times { Part.create!(name: "oxygen tank", part_no: 57114, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }
20.times { Part.create!(name: "liquid nitrogen", part_no: 96587, warehouse_id: [1,2,3,4,5,6,7].sample, received_by_id: [1,2].sample, removed: false) }


order1 = Order.create(description: "new parts for rocket", warehouse_id: 1, employee: manager)

order2 = Order.create(description: "new parts for superloop", warehouse_id: 2, employee: manager2)

order3 = Order.create(description: "Jules private experiment", warehouse_id: 1, employee: manager)

order1.parts << Part.create!(name: "beaker", part_no: 20001, removed: false, warehouse_id: 1)
order1.parts << Part.create!(name: "thruster", part_no: 69021, removed: false, warehouse_id: 1)
order1.parts << Part.create!(name: "oxygen tank", part_no: 57114, removed: false, warehouse_id: 1)
order2.parts << Part.create!(name: "beaker", part_no: 20001, removed: false, warehouse_id: 1)
order2.parts << Part.create!(name: "fan", part_no: 86951, removed: false, warehouse_id: 1)
order2.parts << Part.create!(name: "safety blanket", part_no: 35486, removed: false, warehouse_id: 1)
order3.parts << Part.create!(name: "safety blanket", part_no: 35486, removed: false, warehouse_id: 1)
order3.parts << Part.create!(name: "goggles", part_no: 20034, removed: false, warehouse_id: 1)
order3.parts << Part.create!(name: "tubes", part_no: 77001, removed: false, warehouse_id: 1)
