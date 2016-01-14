User.create!(name:  "Ngoc Vu",
  email: "ngocvu.uet@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  remember_digest: "123456",
  role: "admin",
  avatar: "false",
  reset_digest: true,
  reset_sent_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: "trainee")
end
