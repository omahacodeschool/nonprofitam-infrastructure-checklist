class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id
  
  belongs_to :user
  
end
