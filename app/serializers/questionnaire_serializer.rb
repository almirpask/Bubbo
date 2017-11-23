class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id ,:theme

  #belongs_to :classroom
  belongs_to :teacher

  class TeacherSerializer < ActiveModel::Serializer
    attributes :name
  end


  #has_many :questions

  # class QuestionSerializer < ActiveModel::Serializer
  #   attributes :id
  #   has_many :alternatives
  # end
end
