# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answers          :json
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  questionnaire_id :integer          not null
#
# Indexes
#
#  index_responses_on_questionnaire_id  (questionnaire_id)
#
# Foreign Keys
#
#  questionnaire_id  (questionnaire_id => questionnaires.id)
#
require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
