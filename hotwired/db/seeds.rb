User.create!(
  email: "admin@email.com",
  company: Company.all.first,
  password: "123456",
  password_confirmation: "123456"
)

User.create!(
  email: "user@email.com",
  company: Company.all.last,
  password: "123456",
  password_confirmation: "123456"
)