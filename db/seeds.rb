AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
amd = AdminUser.create!(email: 'electonic@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

(0..32).each do |i|
  user = User.create!(name: "user#{i}", email: "user#{i}@example.com", password: 'password', password_confirmation: 'password', avatar: open("app/assets/images/ryan.jpg"))
end

offer1 = Offer.create!(user: User.find(1), name: 'PRO ROGI KIEROWNICY PROSTE', description: 'kute na zimnoGRUBEdługość: 80 mmkolor',
                       actual_price: 30, original_price: 62.90, confirmed:true,
                       url: 'https://www.ceneo.pl/39081104', avatar: open("app/assets/images/product/1.jpg"))

offer2 = Offer.create!(user: User.find(2), name: 'DipSize - Ring Size Adjuster', description: 'DipSize is clear liquid plastic that you can dip the bottom of your ring into.',
                       actual_price: 20, original_price: 80, confirmed:true,
                       url: 'https://www.amazon.com/DipSize-Adjuster-Reducer-Drying-Rubber/dp/B00NC6ET38', avatar: open("app/assets/images/product/2.jpg"))

offer3 = Offer.create!(user: User.find(3), name: 'Anet E12 Large Size', description: '300 x 300 x 400 3D Printer DIY Kit',
                       actual_price: 1000, original_price: 1200, confirmed:true,
                       url: 'https://www.anet3d.shop/products/anet-e12-large-size-300-x-300-x-400-3d-printer-diy-kitx', avatar: open("app/assets/images/product/3.png"))

offer4 = Offer.create!(user: User.find(4), name: 'URBAN DECAY', description: 'Settings Spray Travel Size Duo Zestaw All Nighter + Rebound',
                       actual_price: 40, original_price: 99, confirmed:true,
                       url: 'http://www.sephora.pl/Makijaz/Zestawy-do-makijazu/Do-twarzy/Settings-Spray-Travel-Size-Duo-Zestaw-All-Nighter-Rebound/P3581009', avatar: open("app/assets/images/product/4.jpg"))


tag1 = Tag.create!(name: 'Electronic')
tag2 = Tag.create!(name: 'Doll')

offer1.tags << tag1
offer1.save!

offer2.tags << tag2
offer2.save!

amd.tags << tag1
amd.save!

Comment.create!(offer: offer1, text: 'Woow! Thi is very good kompik!', user: User.find(1))