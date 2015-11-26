user_emails = ['second-user@example.com', 'third-user@example.com', 'fourth-user@example.com']
all_tags = ['ruby-on-rails', 'ruby', 'javascript', 'java', 'php']

User.create!(
  email: 'word_25@mail.ru',
  password: 'sharovik',
  password_confirmation: 'sharovik',
  login: 'Michael',
  avatar: File.open(File.join(Rails.root, '/test/assets/images/avatar-1.jpg')),
  birthday: '1957/09/12',
  country: 'USA',
  city: 'Boston',
  address: 'Billy Jean 8'
  )

3.times do |i|
  User.create!(
    email: user_emails[i % user_emails.length],
    password: 'password',
    password_confirmation: 'password',
    login: Faker::Internet.user_name,
    avatar: File.open(File.join(Rails.root, "/test/assets/images/avatar-#{i+2}.jpg")),
    birthday: Faker::Date.backward,
    country: Faker::Address.country,
    city: Faker::Address.city,
    address: Faker::Address.street_address
  )
end

20.times do |i|
  Question.create!(
    header: Faker::Hacker.say_something_smart,
    description: Faker::Lorem.paragraph,
    user_id: i % 4 + 1,
    all_tags: all_tags.shuffle.sample,
    answers_attributes: [{
      user_id: rand(1..4),
      body: Faker::Lorem.paragraph
    }, {
      user_id: rand(1..4),
      body: Faker::Lorem.paragraph
    }, {
      user_id: rand(1..4),
      body: Faker::Lorem.paragraph
    }, {
      user_id: rand(1..4),
      body: Faker::Lorem.paragraph
    }])
end
