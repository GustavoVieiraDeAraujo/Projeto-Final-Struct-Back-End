class CreatePartnerships < ActiveRecord::Migration[6.1]
  def change
    create_table :partnerships do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
