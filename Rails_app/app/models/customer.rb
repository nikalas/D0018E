class Customer < ApplicationRecord
  #TODO Should emails be stored as lowercase?
  #before_save { self.email = email.downcase }
	
  validates :name,  presence: true, length: { maximum: 127 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, length: { maximum: 127 },
                    format: { with: EMAIL_REGEX }, 
					uniqueness: { case_sensitive: false }

  P_NR_REGEX = /\A\d{6}[-+]\d{4}\z/
  validates :p_nr, format: { with: P_NR_REGEX }, allow_blank: true

  has_secure_password

  #TODO Decide minimum password requirements
  #validates :password, presence: true, length: { minimum: 6 }  
end
