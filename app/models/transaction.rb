class Transaction < ApplicationRecord
  belongs_to :budget, dependent: :destroy
  validates_inclusion_of :transaction_type, in: ["expense", "income"]
end
