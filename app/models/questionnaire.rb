class Questionnaire < ActiveRecord::Base
  has_many :questions, through: :questionnaire_question_relations
  belongs_to :lessons

  PHASE = ["prepare", "after", "gain", "behavior"]
end
