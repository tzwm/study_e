class QuestionsController < ApplicationController

  def create
    @question = Question.create! question_params

    respond_to do |format|
      format.json { render json: {'status' => 'success',
                                  'question' => {'id' => @question.id,
                                                 'title' => @question.title}}}
    end
  end


  private

  def question_params
    params.permit(:title)
  end

end
