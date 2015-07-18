class QuestionnairesController < ApplicationController
  before_action :find_and_auth_phase, :find_lesson

  def new
    
  end

  def create
    
  end

  private

  def find_and_auth_phase
    @phase = params[:phase]
    redirect_to root_path unless @phase
  end

  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
