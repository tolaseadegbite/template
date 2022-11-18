class AddAttributesToQuestionnaire < ActiveRecord::Migration[6.1]
  def change
    add_column :questionnaires, :level, :string
    add_column :questionnaires, :semester, :integer, min: 1, max: 2
  end
end
