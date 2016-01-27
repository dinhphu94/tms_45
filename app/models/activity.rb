class Activity < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  ACTION = {CREATE_COURSE: "CREATE_COURSE",
    UPDATE_COURSE: "UPDATE_COURSE"}

  belongs_to :user

  class << self
    def self.add_activity target_name, target_id, user_id, content
      Activity.create target_name: target_name, target_id: target_id, user_id: user_id,
        content: content
    end

    def find_target_class
      if target_name == "CREATE_COURSE" or "UPDATE_COURSE"
        @course = Course.find target_id
        @course.name
      end
    end

    def find_target_user
      if user_id
        @user = User.find user_id
        @user.name
      end
    end
  end
end
