class UserCourse < ActiveRecord::Base
  enum status: [:open, :started, :finished]

  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy

  before_create :set_unique_active
  after_create :create_user_subjects
  after_save :update_user_subjects_status

  scope :joined_by, ->(user) {where user_id: user.id}
  scope :joined_as_trainee, ->(user) {where "user_id = ? AND supervisor = ?",
    user.id, false}

  class << self
    def build_users added_users, course
      users = User.trainee
      users.each do |user|
        course.user_courses.build user_id: user.id unless
          added_users.include? user
      end
    end
  end

  private
  def set_unique_active
    UserCourse.where(user_id: user_id).each do |user_course|
      user_course.status = Settings.user_subject.status.default_status if user_course.started?
      user_course.save
    end
    status = Settings.user_subject.status.status_start
  end

  def create_user_subjects
    if course.subjects.present?
      course.subjects.each do |subject|
        user_subjects.create user: user, subject: subject, status: 0
      end
    end
  end

  def update_user_subjects_status
    user_subjects.each{|user_subject| user_subject.update status: status} if user_subjects.present?
  end
end
