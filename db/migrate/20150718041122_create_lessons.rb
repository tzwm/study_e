class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.boolean :is_template, null: false, default: false
      t.string :title, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
