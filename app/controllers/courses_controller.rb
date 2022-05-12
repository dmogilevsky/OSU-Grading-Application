require "httparty"
require "active_record"
# The courses controller is responsible for all course related operations
class CoursesController < ApplicationController
  def index
    @pagy, @courses = pagy(Course.all.order(params[:sort]))
    @pagy, @sections = pagy(Section.all)

    if params[:search]
      search_courses
    end
  end

  # Search for courses given a course number
  def search_courses
    @pagy, @courses = pagy(Course.where("CourseNumber LIKE ?", "%" + params[:search] + "%"))
  end

  # Delete a course based on id, and first purge all sections belonging to that course
  def delete_course
    if current_user.admin? and current_user.approved
      sections = Section.where("course_id=?", params[:id])
      sections.each do |section|
        Section.delete(section.id)
      end
      Course.delete(params[:id])
    end
    redirect_to(courses_path)
  end

  # Create a new course with given parameters
  def create
    new_course = params[:course]
    Course.create(Subject: new_course[:Subject], CourseNumber: new_course[:CourseNumber],
                  CourseName: new_course[:CourseName], Campus: new_course[:Campus], Career: new_course[:Career])
    redirect_to(courses_path)
  end

  # Render the edit form for the course and populate all the form fields with current data for the course
  def edit
    course = Course.find(params[:id])
    respond_to do |format|
      format.html { render :edit_courses, locals: { course: course } }
    end
  end

  # Update the course with given params
  def update
    course = Course.find(params[:id])
    respond_to do |format|
      format.html do
        if course.update(params.require(:course).permit(:CourseName, :Subject, :CourseNumber, :Campus, :Career))
          flash[:success] = 'Course updated successfully'
          redirect_to(courses_path)
        else
          flash.now[:error] = 'Error: Course could not be updated'
          render :edit, locals: { course: course }
        end
      end
    end
  end

  def update_course
    course = Course.find(params[:id])
    course.CourseName = params[:name]
    course.Subject = params[:subject]
    course.CourseNumber = params[:coursenumber]
    course.Campus = params[:campus]
    course.Career = params[:career]
    course.save
  end

  # Run repopulate db with the default criteria
  def refresh_db
    populate_db("CSE", "", "", "", "")
    redirect_to(admin_path)
  end

  # Populates the db from the OSU API based on criteria for subject, campus, page number, term, and academic
  # career
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
      newcourse = Course.new(Subject: course["subject"], CourseNumber: course["catalogNumber"],
                             CourseName: course["title"], Campus: course["campus"], Career: course["academicCareer"])
      newcourse.save
      courseContainer["sections"].each { |section|
        timestring = ""
        more_than_1_meeting = false
        section["meetings"].each { |meeting|
          if meeting["startTime"]
            if more_than_1_meeting
              timestring.concat(", ")
            end
            if meeting["monday"]
              timestring.concat("M")
            end
            if meeting["tuesday"]
              timestring.concat("T")
            end
            if meeting["wednesday"]
              timestring.concat("W")
            end
            if meeting["thursday"]
              timestring.concat("TH")
            end
            if meeting["friday"]
              timestring.concat("F")
            end
            if meeting["saturday"]
              timestring.concat("SAT")
            end
            if meeting["sunday"]
              timestring.concat("SUN")
            end
            timestring.concat(": " +meeting["startTime"] + "-" + meeting["endTime"])
            more_than_1_meeting = true
          end
        }
        Section.create!(SectionNumber: section["section"], course_id: newcourse.id, Term: section["term"],
                        MeetingTime: timestring)
      }
    }
  end

  # Remove all courses and sections from the db, but keep the users
  def clean_db
    Section.find_each(&:destroy)
    Course.find_each(&:destroy)
  end
end



