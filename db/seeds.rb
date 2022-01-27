# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Leandro', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUaCqV82Sk8PWxYNJNvGLouPaNFP-WQiNzhWadmr-8JcZQNocqvcEHXUnbd4dj8XfuU6E&usqp=CAU', bio: 'I am a software developer')
User.create(name: 'Eliana', photo: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg', bio: 'I am a dog lover')
User.create(name: 'John', photo: 'https://www.nbc12.com/resizer/PYpib-yMwtwI-0d-VOuWhdvZZy4=/arc-photo-gray/arc3-prod/public/2BNPCSU4ENHWDCZLK4KJU2JC5A.jpg', bio: 'I wish to travel the world')
User.create(name: 'Elisa', photo: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVtYWxlJTIwcG9ydHJhaXR8ZW58MHx8MHx8&w=1000&q=80', bio: 'Looking for new opportunities')
