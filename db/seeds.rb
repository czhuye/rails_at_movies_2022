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
Page.delete_all

# add the file path of the  csv file
filename = Rails.root.join("db/top_movies.csv")

# puts "Loading Movies from the CSV file: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |m|
  # puts movie["original_title"]
  production_company = ProductionCompany.find_or_create_by(name: m["production_company"])

  if production_company && production_company.valid?
    # create a new movie
    movie = production_company.movies.create(
      title:        m["original_title"],
      year:         m["year"],
      duration:     m["duration"],
      description:  m["description"],
      average_vote: m["avg_vote"]
    )
    puts "Invalid move #{m['original_title']}" unless movie&.valid?
  else
    puts "invalid production company #{m['production_company']} for movie #{m['original_title]']}"
  end
end

Page.create(
  title:     "About the Data",
  content:   "The data powering this website was provided by Kaggle.",
  permalink: "about"
)

Page.create(
  title:     "Contact Us",
  content:   "If you like this groovy website and would like to reach out",
  permalink: "contact"
)

puts "Created #{ProductionCompany.count} ProductionCompanies"
puts "Created #{Movie.count} Movies"
