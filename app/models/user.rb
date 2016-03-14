class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def year() 
    Date.current.year - self.yob
  end 
 
  def age_options    
   (1..self.yob).to_a 
  end
 
end
