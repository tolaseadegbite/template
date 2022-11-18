# == Schema Information
#
# Table name: questionnaires
#
#  id          :integer          not null, primary key
#  description :text
#  level       :string
#  name        :string
#  semester    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
require "test_helper"

class QuestionnaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
