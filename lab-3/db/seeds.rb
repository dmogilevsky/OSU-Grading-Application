# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

# Populate DB with all CSE courses
CoursesController.new.populate_db("cse", "", "","","")

# Create default admin user
User.create!(email: "admin.1@osu.edu", password: "password",
             role: 2, approved: 1)
# temp grader form
Graderform.create!(student _id:2,Form:"123455")