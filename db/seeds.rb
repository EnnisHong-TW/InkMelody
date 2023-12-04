# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "建立資料中..."
5.times do
  email = Faker::Internet.email
  user = User.find_or_create_by(email:) do |u|
    u.password = '123456'
  end

  puts "使用者:#{user.email}"

  10.times do
    product = user.products.create(title: Faker::Book.title, description: Faker::Lorem.paragraph, price: rand(10..100))
    puts "產品:#{product.title}"
  end
  # user = User.find_by(email: )
  # if not user
  #   User.create(email: , password: '123456')
  # end
end

puts "建立資料完成..."
