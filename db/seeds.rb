# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!
user2 = User.create!

post1 = user1.posts.create({content: 'Here is my first post'})
post2 = user2.posts.create({content: 'I also have an opinion, hear me!'})

post1.replies.create({content: 'Nice job!', user: user2})
post1.replies.create({content: 'Thank you :)', user: user1})

post2.replies.create({content: 'Nice post good sir!', user: user1})
post2.replies.create({content: 'Thank you for the kind words stranger', user: user2})