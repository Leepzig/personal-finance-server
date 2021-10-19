# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bob = User.create(first_name:"Bobo", last_name:"Bobsalot", email:"bobo@enoch.com", password:"123")

bob.budgets.create(header:"October 2021")
bob.budgets.create(header:"November 2021")

bob.budgets.first.transactions.create(name:"rent", budgeted:700, actual:700, transaction_type:"expense")
bob.budgets.first.transactions.create(name:"groceries", budgeted:500, actual:650, transaction_type:"expense")
bob.budgets.first.transactions.create(name:"gas", budgeted:200, actual:150, transaction_type:"expense")
bob.budgets.first.transactions.create(name:"eating out", budgeted:300, actual:500, transaction_type:"expense")
bob.budgets.first.transactions.create(name:"phone bill", budgeted:70, actual:70, transaction_type:"expense")
bob.budgets.first.transactions.create(name:"week1 paycheck", budgeted:750, actual:750, transaction_type:"income")
bob.budgets.first.transactions.create(name:"week2 paycheck", budgeted:750, actual:850, transaction_type:"income")
bob.budgets.first.transactions.create(name:"week3 paycheck", budgeted:750, actual:650, transaction_type:"income")
bob.budgets.first.transactions.create(name:"week4 paycheck", budgeted:750, actual:800, transaction_type:"income")

bob.budgets.second.transactions.create(name:"eating out", budgeted:500, actual:0, transaction_type:"expense")
bob.budgets.second.transactions.create(name:"phone bill", budgeted:70, actual:0, transaction_type:"expense")
bob.budgets.second.transactions.create(name:"week1 paycheck", budgeted:750, actual:0, transaction_type:"income")
bob.budgets.second.transactions.create(name:"week2 paycheck", budgeted:750, actual:0, transaction_type:"income")