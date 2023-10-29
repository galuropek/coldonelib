30.times do
  brand = Faker::Beer.brand
  title = Faker::Beer.name
  Beer.create brand: brand, title: title
end
