class User < ActiveRecord::Base
  has_many :user_subjects
  has_many :activities
  has_many :user_courses
  has_many :user_tasks
end
