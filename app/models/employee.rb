class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  acts_as_birthday :date_of_birth

  attr_accessor :login

  def self.default_scope
    with_deleted
  end

  acts_as_paranoid

  def active_for_authentication?
    !deleted?
  end

  scope :activated, -> { where(activated: true) }
  scope :with_age, -> { where.not(age: nil) }

  def login=(login)
    @login = login
  end

  def login
    @login || self.service_no || self.email
  end

  def next_away_event
    Event.first
    #events.away.where('start_date >= ?', Date.today).order('start_date').first
  end

  devise :database_authenticatable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable, authentication_keys: [:login]

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
	has_many :dependants
	has_many :next_of_kins
	has_many :phones
  has_many :events
	has_many :addresses
  has_many :notes
  has_many :reports
  has_many :trade_careers
  has_many :medical_records
  has_many :responsibilities
  has_many :promotion_dates
  has_many :suggestions
  has_many :announcements
  has_and_belongs_to_many :competencies
  has_and_belongs_to_many :qualifications

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  before_validation :set_age

  def years_of_service
    Date.today.year - service_start_date.year
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(service_no) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  private

  def set_age
    self.age = date_of_birth_age
  end
end
