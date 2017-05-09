class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :oath_token_secret

      t.timestamps
    end
  end
end
