class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :lesson_id, null: false, index: true
      t.string :phase, null: false, index: true

      t.timestamps null: false
    end

    add_index :questionnaires, [:lesson_id, :phase]
  end
end
