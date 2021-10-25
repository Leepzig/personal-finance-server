class Transaction < ApplicationRecord
  belongs_to :budget
  validates_inclusion_of :transaction_type, in: ["expense", "income"]
  validates :actual, numericality: { only_integer: true }
  validates :budgeted, numericality: { only_integer: true }
end
