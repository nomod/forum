ip = []

1000.times do
  ip.push(Faker::Internet.ip_v4_address)
end

User.delete_all
User.reset_pk_sequence
100.times do
  User.create(login: Faker::Name.first_name)
end

users = User.all

Post.delete_all
Post.reset_pk_sequence
2000.times do
  Post.create(header: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, login: users[rand(0..80)].login, user_ip: ip[rand(0..900)])
end

Mark.delete_all
Mark.reset_pk_sequence
500.times do

  post_id = Faker::Number.between(1, 500)
  login = users[rand(0..80)].login

  mark = Mark.find_by(post_id: post_id, login: login)

  if mark

  else
    Mark.create(value: Faker::Number.between(1, 5), post_id: post_id, login: login)
  end

end

