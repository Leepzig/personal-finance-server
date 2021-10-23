class Budget < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  validates :actual, numericality: { only_integer: true }
  validates :budgeted, numericality: { only_integer: true }
  #validate actual and budgeted must be integers

  def income
    self.transactions.where('transaction_type = ?', 'income')
  end

  def expenses
    self.transactions.where('transaction_type = ?', 'expense')
  end

  
  def income_total
    type_total(self.income)
  end
  
  def expense_total
    type_total(self.expenses)
  end

  private
    #helper methods
    def type_total(transaction_array)
      budgeted_total = transaction_array.map {|transaction| transaction.budgeted}.reduce(:+) 
      actual_total = transaction_array.map {|transaction| transaction.actual}.reduce(:+)
      return {name:"Total", budgeted:budgeted_total, actual:actual_total}
    end

end
