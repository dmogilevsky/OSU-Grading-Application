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
#require "../app/models/course.rb"
#require "../app/models/section.rb"
url = "https://content.osu.edu/v2/classes/search?q=&subject=cse"
page_data = HTTParty.get(url)
response = OpenStruct.new(page_data.parsed_response) # Response is of type Hash, made into OpenStruct
#puts response.data.keys
#puts response.data["courses"] # Courses is an array of hashes
puts "#########################Course keys######################"
puts response.data["courses"][0]["course"].keys
puts "#########################Section keys######################"
puts response.data["courses"][0]["sections"][0].keys
response.data["courses"].each { |courseContainer| #Each "course" contains a course (hash) and sections (array)
  course = courseContainer["course"]
  Course.create(CourseID: course["courseID"],Subject: course["subject"],CourseNumber: course["catologNumber"],
                CourseName: course["title"])
  courseContainer["sections"].each { |section|
    puts section["section"]
    Section.create(SectionID: section["classNumber"], courses_id: section["courseId"])
  }
}
