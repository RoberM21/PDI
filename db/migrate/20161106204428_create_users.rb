class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :token
      t.string :password_digest
      t.boolean :email_confirmed
      t.boolean :confirm_token

      t.timestamps null: false
    end
  end
end
