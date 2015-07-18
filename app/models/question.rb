class Question < ActiveRecord::Base
  has_many :answers
  has_many :questionnaire_question_relations
  has_many :questionnaires, through: :questionnaire_question_relations
end
