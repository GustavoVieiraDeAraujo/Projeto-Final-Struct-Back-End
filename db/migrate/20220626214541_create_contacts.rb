class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :localization
      t.string :email
      t.integer :number

      t.timestamps
    end
  end
end
