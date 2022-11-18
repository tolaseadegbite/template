# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  name             :string
#  question_type    :integer
#  required         :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  questionnaire_id :integer          not null
#
# Indexes
#
#  index_questions_on_questionnaire_id  (questionnaire_id)
#
# Foreign Keys
#
#  questionnaire_id  (questionnaire_id => questionnaires.id)
#
class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }

  def self.question_type_select
    question_types.keys.map { |k| [k.titleize, k] }
  end
end
