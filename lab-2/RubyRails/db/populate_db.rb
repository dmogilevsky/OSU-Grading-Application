# httparty.rb
require "httparty"
require "active_record"
require "../app/models/course"
require "../app/models/section"

def resetDB
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
      Section.create(SectionID: section["classNumber"], CourseID: section["courseId"])
    }
  }
end