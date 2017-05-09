class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :oath_token_secret, :oauth_token_secret
  end
end
