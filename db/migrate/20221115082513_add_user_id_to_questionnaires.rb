class AddUserIdToQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    add_column :questionnaires, :user_id, :intger
  end
end
