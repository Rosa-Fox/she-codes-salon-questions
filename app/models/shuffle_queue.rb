class ShuffleQueue

  def initialize
    @questions = Question.where(seen: false).uniq
  end

  def shuffle!
    @questions.shuffle!
  end

  def last
    question_id = @questions.pluck(:id).pop
    question = Question.find(question_id)
    question.update_attribute(:seen, true)
    question.question
  end

  def any?
    @questions.any?
  end
end
