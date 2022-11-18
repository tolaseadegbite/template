# == Schema Information
#
# Table name: lecturer_responses
#
#  id                        :integer          not null, primary key
#  answers                   :json
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  lecturer_questionnaire_id :integer          not null
#
# Indexes
#
#  index_lecturer_responses_on_lecturer_questionnaire_id  (lecturer_questionnaire_id)
#
# Foreign Keys
#
#  lecturer_questionnaire_id  (lecturer_questionnaire_id => lecturer_questionnaires.id)
#
class LecturerResponse < ApplicationRecord
  belongs_to :lecturer_questionnaire
end
