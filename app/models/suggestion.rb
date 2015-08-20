class Suggestion < ActiveRecord::Base
  belongs_to :employee

  validates :title, presence: true
  validates :body, presence: true
  validates :employee, presence: true
end
