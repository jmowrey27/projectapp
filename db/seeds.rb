# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

category_names = ['Televisions', 'Gaming', 'Home Video', 'Accessories', 'Monitors', 'Laptops']

categories = category_names.map do |category_name|
  Category.create!(name: category_name)
end

number_of_products = 50

number_of_products.times do
  product_name = Faker::Commerce.product_name
  price = Faker::Commerce.price(range: 20..500.0).to_d
  category = categories.sample
  description = Faker::Lorem.sentence

  product = Product.create!(
    name: product_name,
    description: description,
    price: price
  )

  ProductCategory.create!(
    product: product,
    category: category
  )
end
