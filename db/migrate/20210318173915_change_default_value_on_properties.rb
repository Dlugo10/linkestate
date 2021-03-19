class ChangeDefaultValueOnProperties < ActiveRecord::Migration[6.0]
  def change
    change_column_default :properties, :sq_meters_added, 0
    Property.where(sq_meters_added: nil).update_all(sq_meters_added: 0)
  end
end
