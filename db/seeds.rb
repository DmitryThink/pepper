AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
amd = AdminUser.create!(email: 'electonic@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


user = User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

offer1 = Offer.create!(user: user, name: 'Kompik', description: 'Very good Kompik', actual_price: 100, original_price: 120, confirmed:true, url: 'facebook.com', avatar: open("app/assets/images/dimg.png"))
offer2 = Offer.create!(user: user, name: 'Dino', description: 'Very good Dino', actual_price: 1000, original_price: 1222, confirmed:true, url: 'vk.com', avatar: open("app/assets/images/dimg.png"))

(0..40).each do
  price = rand(10..10000)
  persent = rand(1..500)
  Offer.create!(user: user, name: 'WithoutTag', description: 'Heh heh heh heh', actual_price: price, original_price: price+price*(persent/100)+1, confirmed:true, url: price.to_s, avatar: open("app/assets/images/dimg.png"))
end

tag1 = Tag.create!(name: 'Electronic')
tag2 = Tag.create!(name: 'Doll')

offer1.tags << tag1
offer1.save!

offer2.tags << tag2
offer2.save!

amd.tags << tag1
amd.save!

Comment.create!(offer: offer1, text: 'Woow! Thi is very good kompik!', user: user)