class CreateLessonQuestionnaireRelations < ActiveRecord::Migration
  def change
    create_table :lesson_questionnaire_relations do |t|
      t.integer :lesson_id, null: false, index: true
      t.integer :questionnaire_id, null: false, index: true
      t.string :phase, null: false, index: true

      t.timestamps null: false
    end

    add_index :lesson_questionnaire_relations, [:lesson_id, :phase]
  end
end
