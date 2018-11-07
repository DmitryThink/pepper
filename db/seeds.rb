AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
amd =AdminUser.create!(email: 'electonic@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


user = User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

offer1 = Offer.create!(user: user, name: 'Kompik', description: 'Very good Kompik', actual_price: 100, original_price: 120, url: 'facebook.com')
offer2 = Offer.create!(user: user, name: 'Dino', description: 'Very good Dino', actual_price: 1000, original_price: 1222, url: 'vk.com')

tag1 = Tag.create!(name: 'Electronic')
tag2 = Tag.create!(name: 'Doll')

offer1.tags << tag1
offer1.save!

offer2.tags << tag2
offer2.save!

amd.tags << tag1
amd.save!

Comment.create!(offer: offer1, text: 'Woow! Thi is very good kompik!', user: user)