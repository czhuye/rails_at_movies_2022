# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

Movie.delete_all
ProductionCompany.delete_all

# add the file path of the  csv file
filename = Rails.root.join("db/top_movies.csv")

# puts "Loading Movies from the CSV file: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |movie|
  # puts movie["original_title"]
  ProductionCompany.create(name: ["production_company"])
end

puts "Created #{ProductionCompany.count} ProductionCompanies"
