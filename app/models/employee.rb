class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable

	validates :service_no, 		presence: true,
								length: { minimum: 5 },
								length: { maximum: 8 },
								format: { with: /\A^\d+$\z/ },
								uniqueness: true

  validates :last_name,          presence: true
  validates :date_of_birth, 	   presence: true
	validates :gender,             presence: true
	validates :service_start_date, presence: true
	validates :substantive_rank,   presence: true
	validates :password, length: { minimum: 6 }, allow_blank: true

  has_many :assignments
  has_many :competencies
	has_many :spouses
	has_many :next_of_kins
	has_many :phones
  has_many :events
	has_many :qualifications
	has_many :addresses
  has_many :notes
  has_many :reports
  has_many :events
  has_many :trade_careers
  has_many :medical_records
  has_many :responsibilities

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def age
     x = Date.today.year - date_of_birth.year
     x -= 1 if Date.today < date_of_birth + x.years #for days before birthday
  end

  def years_of_service
    Date.today.year - service_start_date.year
  end
end
