# == Schema Information
#
# Table name: lecturer_answers
#
#  id                   :integer          not null, primary key
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  lecturer_question_id :integer          not null
#
# Indexes
#
#  index_lecturer_answers_on_lecturer_question_id  (lecturer_question_id)
#
# Foreign Keys
#
#  lecturer_question_id  (lecturer_question_id => lecturer_questions.id)
#
require "test_helper"

class LecturerAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
