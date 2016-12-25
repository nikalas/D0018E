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
  validates :password,  confirmation: true,
                        :presence => { :on => :create },
                        length: { minimum: 6 }

  # TODO check that password is the same as password_confirmation. This should
  # work automaticly, but does not. 
#  validates_confirmation_of :password
#  validates :password_confirmation, length: { minimum: 6 }
end
