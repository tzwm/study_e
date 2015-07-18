class QuestionsController < ApplicationController
  before_action :find_question, only: [:destroy]

  def create
    @question = Question.create! question_params

    respond_to do |format|
      format.json { render json: {'status' => 'success',
                                  'question' => {'id' => @question.id,
                                                 'title' => @question.title}}}
    end
  end

  def create_and_relate
    respond_to do |format|
      format.json { render json: {'status' => 'error',
                                  'message' => 'missing questionnaire_id'}}
    end unless params[:questionnaire_id]

    @question = Question.create! question_params
    QuestionnaireQuestionRelation.create!(question_id: @question.id,
                                          questionnaire_id: params[:questionnaire_id])
    respond_to do |format|
      format.json { render json: {'status' => 'success',
                                  'question' => {'id' => @question.id,
                                                 'title' => @question.title}}}
    end
  end

  def destroy
    QuestionnaireQuestionRelation.where(question_id: @question.id).destroy_all
    @question.destroy

    redirect_to :back
  end


  private

  def question_params
    params.permit(:title)
  end

  def find_question
    @question = Question.find(params[:id])
  end

end
