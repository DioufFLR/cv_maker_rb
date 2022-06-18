class Competence < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, length: {maximum: 1000}
end
