class LessonsController < ApplicationController
  before_action :find_lesson, only: [:show, :edit, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
    @questionnaires = Questionnaire::PHASE.map do |phase|
      Questionnaire.where(phase: phase,
                          lesson_id: @lesson.id).last
    end
  end

  def new
  end

  def create
    @lesson = Lesson.create! lesson_params

    redirect_to new_lesson_questionnaire_path(@lesson.id, phase: Questionnaire::PHASE[0])
  end

  def destroy
    @lesson.destroy

    redirect_to lessons_path
  end

  private

  def lesson_params
    params.permit(:title, :description)
  end

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end
end
