class User < ActiveRecord::Base
  def to_pleasant_string
    "Name - #{first_name}   Email:- #{email}"
  end
end
