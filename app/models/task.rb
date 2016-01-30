class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :user_tasks
  has_many :user_subjects, through: :user_tasks

  scope :filter_by_subject, ->subject{where subject_id: subject.id}
end
