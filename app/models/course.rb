class Course < ActiveRecord::Base
  has_many :user_courses, dependent: :destroy, inverse_of: :course
  has_many :subject_courses, dependent: :destroy
  has_many :subjects, through: :subject_courses
  has_many :users, through: :user_courses

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :status, presence: true
  validate :valid_deadline

  accepts_nested_attributes_for :subject_courses, reject_if:
    proc {|a| a[:subject_id].blank? || a[:subject_id] == 0}
  accepts_nested_attributes_for :subjects, allow_destroy: true, reject_if:
    proc {|a| a[:name].blank? && a[:description].blank?}
  accepts_nested_attributes_for :user_courses, allow_destroy: true, reject_if:
    proc {|a| a[:user_id].blank? || a[:user_id] == 0}

  def build_subject_courses list_subjects = {}
    Subject.all.each do |subject|
      unless list_subjects.include? subject
        self.subject_courses.build subject_id: subject.id
      end
    end
  end

  def trainees
    User.list_by_role id, false
  end

  def supervisors
    User.list_by_role id, true
  end

  def have_subject_course? subject_course_id
    subject_courses.where(id: subject_course_id).present?
  end

  private
  def valid_deadline
    return if [end_date.blank?, start_date.blank?].any?
    if start_date > end_date
      errors.add :deadline, I18n.t("admin.error_messages.deadline")
    end
  end
end
