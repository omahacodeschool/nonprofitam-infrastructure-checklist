class Checklist < ActiveRecord::Base
  attr_accessible :name, :questions_attributes
  
  
  has_many :questions 
<<<<<<< HEAD
  accepts_nested_attributes_for :questions, allow_destroy: true\
  
  
  # Public: Counts the integer total amount of questions associated to a given Checklist(n)
  #
  # @hecklist  - A given ActiveRecord Checklist
  # @total - Uses ActiveRecord associations to find number of questions
  #
  # Examples
  #
  #   total_questions(3)
  #   # => 10
  #
  def total_questions
      total =  self.questions.length
      total 
    end
  
=======
  accepts_nested_attributes_for :questions, allow_destroy: true
  
  
  def total_questions(n)
    @checklist = Checklist.find(n)
    @total =  @checklist.questions.length
    @total 
  end
    
>>>>>>> origin
end
