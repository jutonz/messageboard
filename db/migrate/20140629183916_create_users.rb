class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :display_name
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
