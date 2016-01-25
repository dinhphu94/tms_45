class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :user_subjects, dependent: :destroy

  before_create :set_unique_active
  after_create :create_user_subjects

  scope :has_active_user, ->(user) {where "user_id = ? AND active = ?", user.id, true}

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
      user_course.active = false if user_course.active
    end
    self.active = true
  end

  def create_user_subjects
    if course.subjects.present?
      course.subjects.each do |subject|
        user_subjects.create user: user, subject: subject, status: 0
      end
    end
  end
end
