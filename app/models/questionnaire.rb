class Questionnaire < ActiveRecord::Base
  has_many :questions, through: :questionnaire_question_relations
  has_many :lessons, through: :lesson_questionnaire_relations

end
