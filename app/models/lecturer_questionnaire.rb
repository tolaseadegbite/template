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
class LecturerQuestionnaire < ApplicationRecord
end
