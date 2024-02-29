# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# # Distributer: Sun Valley
# distributer1 = DistributionCenter.create(name: 'Sun Valley')
# distributer1.products.create(name: 'Peonies', price: 15.25)

# # Distributer: Green Valley
# distributer2 = DistributionCenter.create(name: 'Green Valley')
# distributer2.products.create(name: 'Jawbreaker', price: 15)

# # Distributer: Agrogana
# distributer3 = DistributionCenter.create(name: 'Agrogana')
# distributer3.products.create([{ name: 'The Minimalist', price: 20 }, { name: 'Jawbreaker', price: 15 }])

DistributionCenter.create([{ name: 'Sun Valley' }, { name: 'Green Valley' }, { name: 'Agrogana' }])

# Fullfiller: Watsonville
FullfillmentCenter.create(name: 'Watsonville')

Product.create([{ name: 'Burlap Bouquet', price: 10 }, { name: 'Peonies', price: 15.25, fullfiller_ids: 1 },
                { name: 'The Minimalist', price: 20, fullfiller_ids: 3 },
                { name: 'Jawbreaker', price: 15, fullfiller_ids: [2, 3] },
                { name: 'Reset Button', price: 25 }])

User.create(first_name: 'Akshat', last_name: 'Patel', email: 'akpatel@deqode.com', password: '12345678')
