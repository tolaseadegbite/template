class CreateLecturerResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturer_responses do |t|
      t.belongs_to :lecturer_questionnaire, null: false, foreign_key: true
      t.json :answers

      t.timestamps
    end
  end
end
