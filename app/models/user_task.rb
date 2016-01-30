class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :user_subject
  after_save :create_task_activity
  after_update :finish_subject

  scope :has_task, ->(target_user, target_task) {
    where user_id: target_user.id, task_id: target_task.id}
  scope :filter_by_user, ->user{where user_id: user.id}

  def create_task_activity
    content = task.name + " " + I18n.t("activity.finished")
    Activity.update_activity user_id, user_subject.subject,
      Settings.target_type.task, content
  end

  def check_finish_subject
    @user_tasks = user_subject.user_tasks
    @all_tasks = task.subject.tasks
    return false unless @user_tasks.length == @all_tasks.length
    @user_tasks.each do |user_task|
      return false unless user_task.present?
    end
    return true
  end

  def finish_subject
    if check_finish_subject
      user_subject.status = 2
      user_subject.save
    end
  end
end
