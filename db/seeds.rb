require 'faker'

15.times do |n|
  Category.create(name: Faker::Commerce.department)
end


150.times do |n|
  Article.create(
    name: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraph(2),
    price: Faker::Number.decimal(2),
    secret: Faker::Number.number(5),
    contact_info: Faker::PhoneNumber.phone_number,
    category_id: rand(16))
  end

