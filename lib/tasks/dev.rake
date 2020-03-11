namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join('public', 'system')

    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "Apagando imagens de public/system #{%x(rm -rf #{images_path})}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate) 
    puts %x(rake db:seed) 
    puts %x(rake dev:generate_admins) 
    puts %x(rake dev:generate_members) 
    puts %x(rake dev:generate_ads)
    
    puts "Setup completado com sucesso!"
  end

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

  desc "Cria Membros Fakes"
  task generate_members: :environment do
  puts "Cadastrando o MEMBROS..."
  100.times do
    Member.create!(
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456"
      )

  end
  puts "MEMBROS cadastrados com sucesso!"  
  end

  desc "Cria Anúncios Fakes"
  task generate_ads: :environment do
    puts "Cadastrando o ANÚNCIOS..."

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

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
