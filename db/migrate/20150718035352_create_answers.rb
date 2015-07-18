class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false, index: true
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
