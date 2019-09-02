
User.create(
  email: "test@test.com",
  password: "password",
  password_confirmation: "password"
  )

  5.times do
    Board.create(
      name: Faker::Job.field,
      priority: Faker::Color.color_name,
      user_id: 1
    )
  end

  # 4.times do
  #   List.create(
  #     name: Faker::Construction.role
  #     priority: Faker::Color.color_name
  #     board_id: b
  #     user_id: 1
  #   )
  # end
  puts "1 User with 10 customers seeded"