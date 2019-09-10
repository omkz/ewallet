class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :type, null: false
      t.references :user, foreign_key: true
      t.bigint :from_id
      t.bigint :to_id

      t.timestamps
    end
  end
end
