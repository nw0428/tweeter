# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_count = User.count

until User.count > 15
  user = User.new(
    email: "fake_user#{user_count += 1}@fake.com",
    password: "who even cares"
  )
  user.save!
end

user_count = User.count

for follower in User.all do
  for followee in User.all do
    begin
      if !follower.following_users.include? followee
        follower.following_users << followee
      end
    rescue
      puts 'rescued'
    end
  end
end

line_num=0
File.open(File.join(Rails.root, 'tweets.csv')).each do |line|
  line_num += 1
  Tweet.new(user_id: line_num % user_count, content: line).save
end