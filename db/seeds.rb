User.create!(name: "Ngoc Vu",
  email: "ngocvu.uet@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  remember_digest: "123456",
  role: 0,
  avatar: "false",
  reset_digest: true,
  reset_sent_at: Time.zone.now)

User.create!(name: "Bach Van Ngoc",
  email: "neversmile12b1@gmail.com",
  password: "123456",
  role: 0)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 1)
end
