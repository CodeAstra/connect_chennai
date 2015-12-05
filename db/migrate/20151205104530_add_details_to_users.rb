class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_reference :users, :locality, index: true, foreign_key: true
    add_column :users, :type_of_help, :integer
  end
end
