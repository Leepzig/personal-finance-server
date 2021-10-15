class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :header, :income, :expenses, :income_total, :expense_total

  # has_many :transactions
end
