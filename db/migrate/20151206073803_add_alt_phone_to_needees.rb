class AddAltPhoneToNeedees < ActiveRecord::Migration
  def change
    add_column :needees, :alt_phone, :string
  end
end
