module UserSubjectsHelper
  def percent_subject_task user_subject
    task_finish = user_subject.subject.tasks.count
    if task_finish > Settings.tasks.start
      percent = user_subject.user_tasks.count * Settings.tasks.complete / task_finish
    end
    number_to_percentage percent, precision: Settings.tasks.start
  end
end
