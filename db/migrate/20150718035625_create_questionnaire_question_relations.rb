class CreateQuestionnaireQuestionRelations < ActiveRecord::Migration
  def change
    create_table :questionnaire_question_relations do |t|
      t.integer :questionnaire_id, null: false, index: true
      t.integer :question_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
