class AddTitleToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :title, :string
  end
end
