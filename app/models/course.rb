class Course < ActiveRecord::Base
  has_many :user_courses
  has_many :subject_courses
end
