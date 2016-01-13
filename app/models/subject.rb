class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :subject_courses
  has_many :tasks
end
