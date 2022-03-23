require "httparty"
require "active_record"
class DbQueryPopulate
  def populate_db(subject, campus, page, term, academic_career)
    clean_db
    url = "https://content.osu.edu/v2/classes/search?q=&"
    if subject != ""
      url = url + "&subject=" + subject
    end
    if campus != ""
      url = url + "&campus=" + campus
    end
    if page != ""
      url = url + "&page=" + page
    end
    if term != ""
      url = url + "&term=" + term
    end
    if academic_career != ""
      url = url + "&academic-career=" + academic_career
    end
    page_data = HTTParty.get(url)
    response = OpenStruct.new(page_data.parsed_response) # Response is of type Hash, made into OpenStruct
    response.data["courses"].each { |courseContainer| #Each "course" contains a course (hash) and sections (array)
      course = courseContainer["course"]
      newcourse = Course.new(Subject: course["subject"],CourseNumber: course["catalogNumber"],
                             CourseName: course["title"], Campus: course["campus"], Career: course["academicCareer"])
      newcourse.save
      courseContainer["sections"].each { |section|
        Section.create!(SectionNumber: section["section"], course_id: newcourse.id, Term: section["term"])
      }
    }
  end
  def clean_db
    Course.find_each(&:destroy)
    Section.find_each(&:destroy)
  end
end
