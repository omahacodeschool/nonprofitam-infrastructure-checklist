
class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id, :answer_hash["key"]
  
  serialize(:answers_hash, Hash)
  belongs_to :user
    
  
    # Public: Returns the integer total amount of a given answer(n)
    #
    # a_hash - The ActiveRecord answer_hash of a given response object
    # answers - Array of 'values' for each 'key' in the a_hash
    # count - counts the amount of times a given value[n] is found in "answers"
    #
    # Examples
    #
    #   counts("Yes")
    #   # => 16
    #
    #  counts("No")
    #   # => 3
    #

  def counts(n) 
    count = Hash.new(0)
    a_hash = self.answers_hash
    answers = a_hash.values
    answers.each{ |ans| count[ans] += 1}
    count[n]
  end
  
  
  # Public: Returns a string corresponding to the percentage that a given answer value(value) appears in a given checklist(checklist_id) 
  #
  # value - string that this method looks for (ie. "Yes", "No", "In Progress")
  # checklist_id - id of a Active Record checklist's associated questions that correspond to the keys in a Response object's "answer_hash"
  #
  # This is calculated with the current_user's response object found using the session 
  #     ie current_user.responseid
  #
  # Examples
  #
  #   counts("Yes")
  #   # => 16
  #
  #  counts("No")
  #   # => 3
  #
  
  def percent(value, checklist_id)
    ans = []
    
    Checklist.find(checklist_id).questions.each do |q|
      ans << self.answers_hash["#{q.id}"] 
    end
    count = Hash.new(0)
    ans.each{ |e| count[e] += 1 }
    
    (((count[value].to_f/Checklist.find(checklist_id).total_questions.to_f)*100).to_i).to_s + "%"
   end
   
   def percentage_for_checklist(checklist_id)
     checklist = Checklist.find(checklist_id)
     
     # Hash, keys are priorities and values are question ids
     priorities_and_questions = checklist.priorities_and_questions
     
     priorities_and_questions_answers = {"Required"=>{}, "Strongly Recommended"=>{}, "Recommended"=> {}}
     
     priorities_and_questions.each do |p,qs|
       qs.each do |q|
         priorities_and_questions_answers[p][q]=self.answers_hash[q.to_s]
       end 
     end
     
     priorities_percentages = {
       "Required"=> {"Yes"=> 0, "No"=> 0, "In Progress"=> 0},
       "Strongly Recommended"=> {"Yes"=> 0, "No"=> 0, "In Progress"=> 0},
       "Recommended"=> {"Yes"=> 0, "No"=> 0, "In Progress"=> 0}
     }
     binding.pry
     # priorities_and_questions_answers.each do |p, qa|
   #     qa.each do |q, a|
   #       priorities_percentages[p]["Yes"] = 0
     
    
   end
   
   
     
end
