class Classroom < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  has_many :questionnaires
  def id_and_description
    "#{subject_id} - #{subject.description}"
  end
end
