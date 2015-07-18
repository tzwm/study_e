class Lesson < ActiveRecord::Base
  has_many :questionnaires, through: :lesson_questionnaire_relations

  PHASE = ["prepare", "after", "gain", "behavior"]
end
