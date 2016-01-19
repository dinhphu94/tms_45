class UserCourse < ActiveRecord::Base
  enum status: {started: 0, finished: 1}

  belongs_to :user
  belongs_to :course
  has_many :user_subjects
end
