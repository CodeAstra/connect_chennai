class CreateNeedees < ActiveRecord::Migration
  def change
    create_table :needees do |t|
      t.string :name
      t.string :phone
      t.references :locality, index: true, foreign_key: true
      t.text :address
      t.text :details
      t.integer :type_of_help

      t.timestamps null: false
    end
  end
end
