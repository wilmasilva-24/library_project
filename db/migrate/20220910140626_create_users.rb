class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password, :limit => 128, :default => "", :null => false
      t.integer :permission, default: 0

      t.timestamps
    end
  end
end
