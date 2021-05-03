class User < ActiveRecord::Base
  #extend Devise::Model
  validates_uniqueness_of :email
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "Name - #{first_name}   Email:- #{email}"
  end

  def self.auth?(email, password)
    exists?(email: email, password_digest: password)
  end
end

#ruby bahut hosiyar admmi sb bnaya hai ab socho ek chij entity kya hota hai singular ya pulural ?? aur uska collection kya hoga table kya hoga phir ? users ?? uska ek instance mtlb ek object ?? usersimple bs yhi naming convention h controller aur views m USERS rehta h CLASS model me USER rehta h kuki controller me ek todo ko handle nhi kr rhi naa ek baar me bahut sara todo ko handle kr rhi lekin mostly class me ek TODO ko ek baar me handle kia jata hai mostly
