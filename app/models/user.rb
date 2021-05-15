# email:string
# password_digest:string
# 
# password:string virtual
# password_confirmation:string virtual
class User < ApplicationRecord
  has_secure_password

  has_many :twitter_accounts

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, 
                                              message: "must be a valid email address" }
end
