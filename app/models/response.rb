class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id
  
  serialize(:answers_hash, Hash)
  belongs_to :user
      
end
