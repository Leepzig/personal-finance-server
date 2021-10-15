require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "transaction type should be 'income' or 'expense" do
    user = User.create(first_name:"bobo", last_name:"bobo", email:"boboo@bo.com", password:"123")
    budget = user.budgets.create(header:"test")
    transaction = budget.transactions.create(name:"dry cleaning", budgeted:30, actual:50, transaction_type:"cheese")
    transaction1 = budget.transactions.create(name:"dry cleaning", budgeted:30, actual:50, transaction_type:"income")
    transaction2 = budget.transactions.create(name:"dry cleaning", budgeted:30, actual:50, transaction_type:"expenses")
    expect(transaction).to_not be_valid
    expect(transaction1).to be_valid
    expect(transaction2).to be_valid
  end

end
