class Recommendation < ActiveRecord::Base
  belongs_to :student, :class_name => 'User'
  belongs_to :instructor, :class_name => 'User'
end
