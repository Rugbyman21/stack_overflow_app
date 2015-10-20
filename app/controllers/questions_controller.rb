class QuestionsController < ApplicationController
  before_action :set_question, only: [:upvote, :downvote]
  def index
    @questions = Question.all.order(:cached_votes_up => :desc)
    render :index
  end


  def show
    @question = Question.find(params[:id])
    render :show
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def upvote
    @question.upvote_from current_user
    redirect_to questions_path
  end

  def downvote
    @question.downvote_from current_user
    redirect_to questions_path
  end



  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:statement, :content)
  end
end
