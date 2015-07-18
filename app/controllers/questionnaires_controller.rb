class QuestionnairesController < ApplicationController
  before_action :find_and_auth_phase, :find_lesson

  def new
    
  end

  def create
    @questionnaire = Questionnaire.create! questionnaire_params

    params["question_ids"].each do |question_id|
      QuestionnaireQuestionRelation.create!(questionnaire_id: @questionnaire.id,
                                            question_id: question_id)
    end
    
    phase_index = Questionnaire::PHASE.index(@phase)
    if phase_index + 1 === Questionnaire::PHASE.size
      redirect_to root_path
    else
      redirect_to new_lesson_questionnaire_path(@lesson.id, phase: Questionnaire::PHASE[phase_index + 1])
    end
  end

  private

  def questionnaire_params
    params.permit(:phase, :lesson_id)
  end

  def find_and_auth_phase
    @phase = params[:phase]
    redirect_to root_path unless @phase
  end

  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
    redirect_to root_path unless @phase
  end
end
