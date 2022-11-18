# == Schema Information
#
# Table name: lecturer_questionnaires
#
#  id          :integer          not null, primary key
#  description :string
#  level       :string
#  name        :string
#  semester    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
require "test_helper"

class LecturerQuestionnaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
