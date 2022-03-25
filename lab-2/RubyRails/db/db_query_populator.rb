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

  # Delete a section with a given id
  def delete_section(section_id)
    Section.delete(section_id)
  end

  # Delete a course with the given id
  def delete_course(course_id)
    Course.delete(course_id)
    Section.delete_all "course_id=" + course_id
  end

  # Create a course with given params
  def create_course(subject, coursenumber, name, campus, career)
    Course.create(Subject: subject,CourseNumber: coursenumber,
               CourseName: name, Campus: campus, Career: career)
  end

  # Create a section with given params
  def create_section(sectionnumber, courseid, term)
    Section.create(SectionNumber: sectionnumber, course_id: courseid, Term: term)
  end

  # Get all admin users who are pending approval
  def get_requests
    User.where(role: 2, approved: nil)
  end

  # Given a user id, update the approved status to 1
  def approve_admin_user(user_id)
    @request = User.find(user_id)
    @request.approved = 1
    @request.save
  end
end
