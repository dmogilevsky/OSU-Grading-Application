class Graderform < ApplicationRecord
  has_one :student, :class_name => 'User'
end
