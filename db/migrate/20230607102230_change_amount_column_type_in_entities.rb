class ChangeAmountColumnTypeInEntities < ActiveRecord::Migration[7.0]
  def change
    change_column :entities, :amount, :decimal, precision: 10, scale: 2, using: 'amount::numeric'
  end
end
