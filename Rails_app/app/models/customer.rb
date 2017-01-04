class Customer < ApplicationRecord
  validates :name,  presence: true, 
                    length: { maximum: 127 }

  before_save { self.email = email.downcase }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, 
                    length: { maximum: 127 },
                    format: { with: EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }

  P_NR_REGEX = /\A\d{6}[-+]\d{4}\z/
  validates :p_nr,  format: { with: P_NR_REGEX }, 
                    allow_blank: true

  has_secure_password
  validates :password,  presence: true,
                        length: { minimum: 6, maximum: 72 },
                        :on => :create
  
  validates :password,  presence: true,
                        length: { minimum: 6, maximum: 72},
                        allow_nil: true,
                        :on => :update
end
