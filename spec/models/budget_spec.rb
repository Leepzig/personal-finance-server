require 'rails_helper'

RSpec.describe Budget, type: :model do
  before :context do
    @user = User.create(first_name:"bobo", last_name:"bobo", email:"bobo@bo.com", password:"123")
    @budget = @user.budgets.create(header:"test")
    @budget.transactions.create(name:"groceries", budgeted:100, actual:90, transaction_type:"expense")
    @budget.transactions.create(name:"eating out", budgeted:100, actual:90, transaction_type:"expense")
    @budget.transactions.create(name:"eating out", budgeted:100, actual:90, transaction_type:"expense")
    @budget.transactions.create(name:"eating out", budgeted:100, actual:90, transaction_type:"income")
    @budget.transactions.create(name:"eating out", budgeted:100, actual:90, transaction_type:"income")
  end
  it "has a header" do
    expect(@budget.header).to eq("test")
  end

  it "#transactions returns an array of all transactions" do
    expect(@budget.transactions.length).to eq(5)
  end

  it "#income returns an array of all transactions of the transaction_type income" do
    expect(@budget.income.length).to eq(2)
  end

  it "#expenses returns an array of all transactions of the transaction_type expense" do 
    expect(@budget.expenses.length.to eq(3))
  end
end
