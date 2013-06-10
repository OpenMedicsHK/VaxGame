namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@vax.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@vax.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

      users = User.all(limit: 6)
      50.times do
        network_id = 1
        sim_size = 10.3
        stars = 2
        vax = '1,2,3,4,5'
        users.each {|user| user.scores.create!(network_id: network_id, sim_size: sim_size, stars: stars, vax: vax)}
      end
    end
  end
end