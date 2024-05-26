# frozen_string_literal: true

require 'faker'

Faker::Config.locale = :es

# User.create(name: 'Oliver', email: 'oliver@oliver.com', password_digest: 'password')

# Content.create(title: 'Teste', description: 'Teste', category: 'Teste', thumbnail_url: 'Teste', content_url: 'Teste')

# Rating.create(user_id: 1, content_id: 1, stars: 5)

User.destroy_all
Contents.destroy_all
Ratings.destroy_all

# Cria 10 usuários
10.times do |i|
  puts "Creating user: #{i}"
  User.create(name: Faker::Name.name, email: Faker::Internet.email(domain: 'gallaxer.com'), password_digest: 'password')
end

# Cria 10 conteúdos para cada usuário
User.all.each do |user|
  5.times do |i|
    Content.create(title: [Faker::Company.name, Faker::Company.industry].join(' - '),
                   description: Faker::Quote.matz,
                   category: "Category #{i}",
                   thumbnail_url: 'https://loremflickr.com/320/240',
                   content_url: "Content #{i}", user:)
  end

  # Cria uma classificação para cada conteúdo de cada usuário
  user.contents.each do |_content|
    Rating.create(stars: rand(1..5))
  end
end
