class AddAuthenticationTokenToAdministrators < ActiveRecord::Migration[6.1]
  def change
    add_column :administrators, :authentication_token, :string, limit: 30
    add_index :administrators, :authentication_token, unique: true
  end
end
