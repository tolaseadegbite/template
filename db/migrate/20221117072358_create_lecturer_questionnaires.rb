class CreateLecturerQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturer_questionnaires do |t|
      t.integer :user_id
      t.string :name
      t.string :level
      t.integer :semester
      t.string :description

      t.timestamps
    end
  end
end
