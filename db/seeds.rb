# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.delete_all
User.delete_all

staff = User.create(
    email: 'nhanvien1@gmail.com',
    role: 'staff',
    password: '123123123'
)

customer = User.create(
    email: 'khachhang1@gmail.com',
    role: 'customer',
    password: '123123123'
)

(1..100).each do |item|
  procategory = Procategory.create(
    name: 'Category ' + item.to_s,
    status: true
  )
  procategory.projects.create(
      title: 'Project '+item.to_s,
      description: 'Description of project '+item.to_s,
      user: staff,
      status: true
  )
end
