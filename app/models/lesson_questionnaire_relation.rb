class LessonQuestionnaireRelation < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :questionnaire
end
