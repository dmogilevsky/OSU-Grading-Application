class GraderForm < ActiveRecord::Base
  has_one :student, :class_name => 'User'
end
