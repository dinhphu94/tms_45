User.create!(name: "Ngoc Vu",
  email: "ngocvu.uet@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "admin",
  avatar: "false")

User.create!(name: "Bach Van Ngoc",
  email: "neversmile12b1@gmail.com",
  password: "123456",
  role: "admin")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: "trainee")
end
