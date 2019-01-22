AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
amd = AdminUser.create!(email: 'electonic@example.com', password: 'password', password_confirmation: 'password')

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
                       url: 'https://www.anet3d.shop/products/anet-e12-large-size-300-x-300-x-400-3d-printer-diy-kit', avatar: open("app/assets/images/product/3.png"))

offer4 = Offer.create!(user: User.find(4), name: 'URBAN DECAY', description: 'Settings Spray Travel Size Duo Zestaw All Nighter + Rebound',
                       actual_price: 40, original_price: 99, confirmed:true,
                       url: 'http://www.sephora.pl/Makijaz/Zestawy-do-makijazu/Do-twarzy/Settings-Spray-Travel-Size-Duo-Zestaw-All-Nighter-Rebound/P3581009', avatar: open("app/assets/images/product/4.jpg"))

offer5 = Offer.create!(user: User.find(5), name: 'ZIAJA Oliwkowa Travel Size', description: 'odżywka do włosów regenerująca, 50ml',
                       actual_price: 2, original_price: 3.89, confirmed:true,
                       url: 'https://www.aptekagemini.pl/ziaja-oliwkowa-travel-size-odzywka-do-wlosow-regenerujaca-50ml.html', avatar: open("app/assets/images/product/5.jpg"))

offer6 =  Offer.create!(user: User.find(6), name: 'Biotherm Celluli Laser Size', description: 'Zaawansowana pielęgnacja aby zmniejszyć odkladanie się tkanki tłuszczowej 150 ml',
                        actual_price: 130, original_price: 148, confirmed:true,
                        url: 'https://henri.pl/product-pol-157-Biotherm-Celluli-Laser-Size-Code-150-ml.html', avatar: open("app/assets/images/product/6.jpg"))

offer7 = Offer.create!(user: User.find(7), name: 'FOTELIK SAMOCHODOWY 0-18 KG', description: 'OBROTOWY GB VAYA I-SIZE PLATINUM COLLECTION + SENSORSAFE',
                       actual_price: 1999, original_price: 2099, confirmed:true,
                       url: 'https://umalucha.pl/produkt/fotelik-samochodowy-0-18-kg-obrotowy-gb-vaya-i-size-platinum-collection-sensorsafe', avatar: open("app/assets/images/product/7.jpg"))

offer8 = Offer.create!(user: User.find(8), name: 'FOTELIK SAMOCHODOWY CONCORD REVERSO', description: 'I-SIZE BEIGE 0-25 KG',
                       actual_price: 999, original_price: 1521, confirmed:true,
                       url: 'https://www.ceneo.pl/47266422', avatar: open("app/assets/images/product/8.jpg"))

offer9 = Offer.create!(user: User.find(9), name: 'CELLEX-C SKIN HYDRATION', description: 'COMPLEX – PRO SIZE 60 ML',
                       actual_price: 400, original_price: 800, confirmed:true,
                       url: 'https://www.skinmedix.com/cellex-c-skin-hydration-complex-60ml/', avatar: open("app/assets/images/product/9.jpg"))

offer10 = Offer.create!(user: User.find(10), name: 'BATERIA GP POWERCELL 15E R6S DUŻY PALUSZEK 4szt', description: 'BATERIA GP POWERCELL 15E R6S DUŻY PALUSZEK 4szt',
                       actual_price: 2, original_price: 3, confirmed:true,
                       url: 'https://allegro.pl/oferta/bateria-gp-powercell-15e-r6s-duzy-paluszek-4szt-7561561658', avatar: open("app/assets/images/product/10.png"))

offer11 = Offer.create!(user: User.find(11), name: 'MASTER OSUSZACZ KONDENSACYJNY', description: 'BIG SIZE DH 7160',
                        actual_price: 9500, original_price: 11125.35, confirmed:true,
                        url: 'https://www.ceneo.pl/47152851', avatar: open("app/assets/images/product/11.jpg"))

offer12 = Offer.create!(user: User.find(12), name: 'Bandage Junior Size Plastic 3', description: 'Junior Size Plastic 3/8 X 1 1/2 100/box',
                        actual_price: 15, original_price: 22, confirmed:true,
                        url: 'https://www.amazon.com/Bandage-Junior-Size-Plastic-100/dp/B0006GE4D2', avatar: open("app/assets/images/product/12.jpg"))

offer13 = Offer.create!(user: User.find(13), name: 'FOTELIK SAMOCHODOWY 0-18 KG', description: 'OBROTOWY GB VAYA I-SIZE PLATINUM COLLECTION + SENSORSAFE',
                        actual_price: 999, original_price: 1200, confirmed:true,
                        url: 'https://www.smykoland.pl/kiddy-fotelik-samochodowy-evoluna-i-size-0-13-kg-steel-grey.html', avatar: open("app/assets/images/product/13.jpg"))

offer14 = Offer.create!(user: User.find(14), name: 'NOWY Portfel Guess czarny z USA! One Size', description: 'NOWY Portfel Guess czarny z USA! One Size',
                        actual_price: 149, original_price: 300, confirmed:true,
                        url: 'https://archiwum.allegro.pl/oferta/nowy-portfel-guess-czarny-z-usa-one-size-i5579754872.html', avatar: open("app/assets/images/product/14.jpg"))

offer15 = Offer.create!(user: User.find(15), name: 'Bibułka King size WUJO ORGANIC KS', description: 'Bibułka King size WUJO ORGANIC KS',
                        actual_price: 3, original_price: 7, confirmed:true,
                        url: 'https://wujo.pl/pl/p/Bibulka-King-size-WUJO-ORGANIC-KS/10514', avatar: open("app/assets/images/product/15.jpg"))

offer16 = Offer.create!(user: User.find(16), name: 'Pieluszka Otulacz PUL, One Size', description: 'Pieluszka Otulacz PUL, One Size, Błękitne Baranki, Doodush',
                        actual_price: 49, original_price: 60, confirmed:true,
                        url: 'https://chmurkabiala.pl/pieluszka-otulacz-pul-one-size-blekitne-baranki-doodush', avatar: open("app/assets/images/product/16.jpg"))

tag1 = Tag.create!(name: 'Electronic')
tag2 = Tag.create!(name: 'For babies')

offer1.tags << tag1
offer16.tags << tag2
offer7.tags << tag2
offer8.tags << tag2

amd.tags << tag1
amd.save!

(1..16).each do |i|
  (i..16).each do |j|
    Comment.create!(offer: eval("offer#{i}"), text: 'Woow!', user: User.find(j))
  end
end

(1..16).each do |i|
  (i..rand(i..32)).each do |j|
    eval("offer#{i}").users << User.find(j)
  end
end
