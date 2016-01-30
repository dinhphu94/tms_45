class UserSubject < ActiveRecord::Base
  enum status: [:open, :started, :finished]

  belongs_to :user
  belongs_to :subject
  belongs_to :user_course

  after_update :finished_subject

  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  accepts_nested_attributes_for :user_tasks, reject_if: proc{|a| a[:task_id] == "0"}

  scope :has_user_with_course, ->(user, user_course) {
    where "user_id = ? AND user_course_id = ?", user.id, user_course.id
  }

  def finished_subject
  end
end
