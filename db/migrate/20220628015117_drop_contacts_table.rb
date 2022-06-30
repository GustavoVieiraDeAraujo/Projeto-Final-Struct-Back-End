class DropContactsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :contacts do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :about, null: false
    end
  end
end
