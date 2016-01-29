class SubjectCourse < ActiveRecord::Base
  attr_accessor :user_id
  enum status: [:open, :started, :finished]

  belongs_to :subject
  belongs_to :course
end
