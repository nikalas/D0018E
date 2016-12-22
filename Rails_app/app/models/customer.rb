class Customer < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 127 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, length: { maximum: 127 },
                    format: { with: EMAIL_REGEX }

  P_NR_REGEX = /\A\d{6}[-+]\d{4}\z/
  validates :p_nr, presence: true, format: { with: P_NR_REGEX }

  has_secure_password
end
