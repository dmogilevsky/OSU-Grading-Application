# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require "httparty"
require "active_record"
url = "https://content.osu.edu/v2/classes/search?q=&subject=cse"
page_data = HTTParty.get(url)
response = OpenStruct.new(page_data.parsed_response) # Response is of type Hash, made into OpenStruct
#puts response.data.keys
#puts response.data["courses"] # Courses is an array of hashes
#puts "#########################Course keys######################"
#puts response.data["courses"][0]["course"].keys
#puts "#########################Section keys######################"
#puts response.data["courses"][0]["sections"][0].keys
response.data["courses"].each { |courseContainer| #Each "course" contains a course (hash) and sections (array)
  course = courseContainer["course"]
  newcourse = Course.new(Subject: course["subject"],CourseNumber: course["catalogNumber"],
                       CourseName: course["title"])
  newcourse.save
  #puts course["title"]
  #puts newcourse.id
  courseContainer["sections"].each { |section|
    # puts section["courseId"] + " " + section["section"]
    Section.create!(SectionNumber: section["section"], course_id: newcourse.id, Campus: section["campus"], Term:
      section["term"])
  }
}

User.create!(email: "admin@osu.edu", password: "password",
             role: 2)
