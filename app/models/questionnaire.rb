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
class Questionnaire < ApplicationRecord

  validates :name, :level, presence: true
  validates :semester, length: { maximum: 2 }
  belongs_to :user
  # belongs_to :level
  # belongs_to :course

  # validates :level_id, presence: true

  # has_many :levels, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  enum level: { "ND I": "ND I", "ND II": "ND II", "HND I": "HND I", "HND II": "HND II" }
end
