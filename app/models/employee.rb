class Employee < ActiveRecord::Base
  attr_accessor :remember_token
	validates :last_name, 		presence: true
	validates :service_no, 		presence: true, 
								length: { minimum: 5 },
								length: { maximum: 8 },
								format: { with: /\A^\d+$\z/ },
								uniqueness: true
	validates :date_of_birth, 	presence: true
	validates :gender, 			presence: true
	validates :service_start_date, presence: true
	validates :substantive_rank, presence: true
	validates :password, length: { minimum: 6 }, allow_blank: true
	has_many :competencies
	has_one :spouse
	has_many :next_of_kins
	has_many :phones
	has_many :qualifications
	has_many :addresses
		
	has_secure_password
	
	  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	  # Returns a random token.
  def Employee.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Employee.new_token
    update_attribute(:remember_digest, Employee.digest(remember_token))
  end
  
    # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
    # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
