class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :name, :budgeted, :actual, :transaction_type

  belongs_to :budget
end
