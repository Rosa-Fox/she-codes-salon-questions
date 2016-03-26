class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_url, notice: 'Thanks!'
    else
      flash.now.alert = 'Form incomplete - please ensure that you have filled out all fields.'
      render 'new'
    end
  end

  def choose
    questions = ShuffleQueue.new

    if questions.any?
      @quest = questions.last
    else
      redirect_to root_url, alert: 'No questions or topics left!'
    end
  end

  def reset
    Question.reset
    redirect_to root_url
  end

  private

  def question_params
    params.require(:question).permit(
    :question
    ).merge(seen: false)
  end
end
