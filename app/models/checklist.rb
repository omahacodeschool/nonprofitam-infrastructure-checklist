class Checklist < ActiveRecord::Base
  attr_accessible :name, :questions_attributes
  
  
  has_many :questions 
  accepts_nested_attributes_for :questions, allow_destroy: true
  
  
  def total_questions(n)
    @checklist = Checklist.find(n)
    @total =  @checklist.questions.length
    @total 
  end
    
end
