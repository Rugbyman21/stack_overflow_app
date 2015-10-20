class AnswersController < ApplicationController

  def index
    @answer = Answer.all
  end


  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    render :new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:author, :content)
  end
end
