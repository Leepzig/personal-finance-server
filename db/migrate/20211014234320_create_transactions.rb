class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :budgeted
      t.integer :actual
      t.string :transaction_type
      t.belongs_to :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
