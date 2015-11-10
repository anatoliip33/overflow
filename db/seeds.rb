User.create!(
  email: '123@mail.ru',
  password: 'sharovik',
  password_confirmation: 'sharovik',
  login: 'Michael',
  avatar: File.open(File.join(Rails.root, "/test/assets/images/avatar-1.jpg")),
  birthday: '1957/09/12',
  country: 'USA',
  city: 'Boston',
  address: 'Billy Jean 8'
  )

20.times do |i|
  Question.create!(
    header: Faker::Hacker.say_something_smart,
    description: Faker::Lorem.paragraph
    )
end
