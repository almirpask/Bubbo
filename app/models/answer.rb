class Answer < ApplicationRecord
  belongs_to :alternative
  belongs_to :user
end
