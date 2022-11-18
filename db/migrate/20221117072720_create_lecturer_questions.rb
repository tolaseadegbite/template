class CreateLecturerQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturer_questions do |t|
      t.belongs_to :lecturer_questionnaire, null: false, foreign_key: true
      t.string :name
      t.integer :question_type
      t.boolean :required

      t.timestamps
    end
  end
end
