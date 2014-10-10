class Question < ActiveRecord::Base
  attr_accessible :description, :priority
  
  belongs_to :checklist
  
  
  
  
end
