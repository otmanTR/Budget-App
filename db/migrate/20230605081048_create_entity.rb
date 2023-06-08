class CreateEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :amount
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
