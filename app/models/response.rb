class Response < ActiveRecord::Base
  attr_accessible :answers_hash, :user_id, :answer_hash["key"]
  
  serialize(:answers_hash, Hash)
  belongs_to :user
  
  def total_questions(n)
    @checklist = Checklist.find(n)
    @total =  @checklist.questions.length
    @total 
  end
  
  def counts(n) 
    count = Hash.new(0)
    a_hash = self.answers_hash
    answers = a_hash.values
    answers.each{ |ans| count[ans] += 1}
    count[n]
  end
  
  def percent(value, checklist_id)
    ans = []
    
    Checklist.find(checklist_id).questions.each do |q|
      ans << self.answers_hash["#{q.id}"] 
    end
    count = Hash.new(0)
    ans.each{ |e| count[e] += 1 }
    (((count[value].to_f/total_questions(checklist_id).to_f)*100).to_i).to_s + "%"
   end
     
end
