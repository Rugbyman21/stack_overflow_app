class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    render :new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end
end
