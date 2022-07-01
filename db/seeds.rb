# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# User.destroy_all
def user_params
    {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'pass_word',
        reset_password_token: nil, 
        reset_password_sent_at: nil, 
        remember_created_at: nil,
        location: Faker::Address.state,
        birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
        education: Faker::University.name,
        other: Faker::Quote.famous_last_words
    }
end

50.times do 
    User.create!(user_params)
end   

@users = User.all

def post_params
    {
        content: Faker::Quote.matz,
        user: @users[rand(@users.length)]
    }
end 

100.times do 
    Post.create!(post_params)
end