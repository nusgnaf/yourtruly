# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
File.open('db/data.csv') do |fh|
  csv = CSV.new(fh, headers: ['name', 'stuid'], converters: [:integer])
  Student.create(csv.map{ |n| n.to_h})
end


#data = Student.create([{ name: 'fang', stuid: 1111}, {name: 'yuan', stuid: 2222}])
