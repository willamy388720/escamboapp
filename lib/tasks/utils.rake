namespace :utils do

  desc "Cria Administradores Fakes"
  task generate_admins: :environment do
  puts "Cadastrando o ADMINISTRADORES..."
  10.times do
    Admin.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456",
      role: [0,0,1,1,1].sample)

  end
  puts "ADMINISTRADORES cadastrados com sucesso!"  
  end

  desc "Cria Anúncios Fakes"
  task generate_ads: :environment do
    puts "Cadastrando o ANÚNCIOS..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      ) 
    end

    puts "ANÚNCIOS cadastrados com sucesso!"  
  end
end
