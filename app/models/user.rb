class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

	def age 
	  Date.current.year - self.yob
	end 
end
