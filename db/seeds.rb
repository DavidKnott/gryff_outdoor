category_1 = Category.create(name: 'hiking')
category_2 = Category.create(name: 'fishing')
category_3 = Category.create(name: 'climbing')

30.times do
  Item.create(
    title:       Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price:       Faker::Commerce.price,
    image: "http://lorempixel.com/400/200/",
    category:    [category_1, category_2, category_3].sample
  )
end

User.create(first_name: "Harry", last_name: "Potter", email: "harry@potter.com",
            password: "a", password_confirmation: "a", role: 1)

FactoryGirl.create(:order)

FactoryGirl.create(:order, status: 1)

FactoryGirl.create(:order, status: 2)