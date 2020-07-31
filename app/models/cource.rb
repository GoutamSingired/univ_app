class Cource < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5, maximum: 50}
  validates :name, presence: true, length: {minimum: 3, maximum: 15}
  validates :name, presence: true, length: {minimum: 10, maximum: 300}

  has_many :student_cources
  has_many :students, through: :student_cources
end
