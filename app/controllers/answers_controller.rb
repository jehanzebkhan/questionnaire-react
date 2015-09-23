class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    head :no_content
  end

  private
  def answer_params
    params.require(:answer).permit(:label, :disabled)
  end
end
