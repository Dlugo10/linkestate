class CreateTaxHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_histories do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :year
      t.integer :value
      t.integer :tax

      t.timestamps
    end
  end
end
