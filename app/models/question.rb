class Question < ActiveRecord::Base
  validates :question, presence: true

  def self.reset
    Question.find_each { |q| q.seen = false; q.save }
  end
end
