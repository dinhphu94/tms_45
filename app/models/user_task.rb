class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :user_subject
  after_save :create_task_activity

  scope :has_task, ->(target_user, target_task) {
    where user_id: target_user.id, task_id: target_task.id}

  def create_task_activity
    content = task.name + " " + I18n.t("activity.finished")
    Activity.update_activity user_id, user_subject.subject,
      Settings.target_type.task, content
  end
end
