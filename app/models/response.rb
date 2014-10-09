class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id
  
  serialize(:answers_hash, Hash)
  belongs_to :user
  
  def import_checklist
    Response.create({user_id: user.id, answers_hash: {question.id => ""}})
  end
  
end
