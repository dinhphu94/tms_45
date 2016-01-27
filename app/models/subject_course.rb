class SubjectCourse < ActiveRecord::Base
  enum status: [:open, :started, :finished]

  belongs_to :subject
  belongs_to :course
end
