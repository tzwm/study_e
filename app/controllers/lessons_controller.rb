class LessonsController < ApplicationController
  def new
  end

  def create
    lesson = Lesson.create! lesson_params

    redirect_to new_lesson_questionnaire_path(lesson.id, phase: Questionnaire::PHASE[0])
  end

  private

  def lesson_params
    params.permit(:title, :description)
  end
end
