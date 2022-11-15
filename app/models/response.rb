class Response < ApplicationRecord
  # store :answers
  belongs_to :questionnaire

  def multiple_choice_answers(id)
    return [] if answers[id.to_s].nil?
    answers[id.to_s].map(&:to_i)
  end
end
