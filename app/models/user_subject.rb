class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :user_course
  has_many :user_tasks

  accepts_nested_attributes_for :user_tasks, reject_if: proc{|a| a[:task_id] == "0"}
end
