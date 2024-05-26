# frozen_string_literal: true

require 'faker'

Faker::Config.locale = :es

USER_COUNT = 20
CONTENT_COUNT = 5

Rating.destroy_all
Content.destroy_all
User.destroy_all

# Create USER_COUNT users
USER_COUNT.times do |i|
  puts "Creating user: #{i}"
  User.create(name: Faker::Name.name, email: Faker::Internet.email(domain: 'gallaxer.com'),
              password_digest: Faker::Internet.password)
end

# Create CONTENT_COUNT for each user
User.all.each do |user|
  CONTENT_COUNT.times do
    content = Content.create(title: [Faker::Company.name, Faker::Company.industry].join(' - '),
                             description: Faker::Lorem.paragraph(sentence_count: 4),
                             category: Faker::Game.genre,
                             thumbnail_url: 'https://loremflickr.com/320/240/all',
                             content_url: Faker::Internet.url)

    # Create one rating for each content to each user
    Rating.create(user_id: user.id, content_id: content.id, stars: Faker::Number.between(from: 0, to: 5))
  end
end
