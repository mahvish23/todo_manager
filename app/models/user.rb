class User < ActiveRecord::Base
  #extend Devise::Model

  def to_pleasant_string
    "Name - #{first_name}   Email:- #{email}"
  end

  def self.auth?(email, password)
    exists?(email: email, password_digest: password)
  end
end
