class Announcement < ActiveRecord::Base
  belongs_to :employee

  validates :title, presence: true
  validates :body, presence: true
  validates :employee, presence: true

  scope :by_created_at, -> { order('created_at DESC') }
end
