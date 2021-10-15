require 'rails_helper'

RSpec.describe Budget, type: :model do
  before :all do
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
    expect(@budget.expenses.length).to eq(3)
  end

  it "#income_total returns a hash with total information" do
    expect(@budget.income_total).to eq({name:"Total", budgeted:200, actual:180})
  end

  it "#expense_total returns a hash with total information" do
    expect(@budget.expense_total).to eq({name:"Total", budgeted:300, actual:270})
  end
end
