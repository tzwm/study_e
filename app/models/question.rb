class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :questionnaires, through: :questionnaire_question_relations
end
