class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :subject_courses
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 50}

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|a| a[:name].blank?}
end
