class Question < ApplicationRecord
  belongs_to :questionnaire

  has_many :alternatives
end
