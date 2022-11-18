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
class Response < ApplicationRecord
  # store :answers
  belongs_to :questionnaire
  belongs_to :user

  def multiple_choice_answers(id)
    return [] if answers[id.to_s].nil?
    answers[id.to_s].map(&:to_i)
  end
end
