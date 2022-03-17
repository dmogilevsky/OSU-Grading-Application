class Course < ActiveRecord::Base
  has_many :sections
  validates_presence_of :CourseID
end