class Graderassignment < ApplicationRecord
  has_one :student, :class_name => 'User'
  has_one :section, :class_name => 'Section'
end
