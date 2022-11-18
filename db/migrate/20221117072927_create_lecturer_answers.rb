class CreateLecturerAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturer_answers do |t|
      t.belongs_to :lecturer_question, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
