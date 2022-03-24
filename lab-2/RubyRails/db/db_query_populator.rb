require "httparty"
require "active_record"
class DbQueries
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
  def delete_section(section_id)
    Section.delete(section_id)
  end
  def delete_course(course_id)
    Course.delete(course_id)
    Section.delete_all "course_id=" + course_id
  end
  def create_course(subject, coursenumber, name, campus, career)
    Course.create(Subject: subject,CourseNumber: coursenumber,
               CourseName: name, Campus: campus, Career: career)
  end
  def create_section(sectionnumber, courseid, term)
    Section.create(SectionNumber: sectionnumber, course_id: courseid, Term: term)
  end
end
