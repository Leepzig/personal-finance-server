class Transaction < ApplicationRecord
  belongs_to :budget
  validates_inclusion_of :transaction_type, in: ["expense", "income"]
end
