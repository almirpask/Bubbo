class Questionnaire < ApplicationRecord
  belongs_to :teacher
  belongs_to :classroom
  has_many :questions
end
