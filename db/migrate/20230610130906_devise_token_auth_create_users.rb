class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""
      t.boolean :allow_password_change, default: true
      t.text :tokens
    end
  end
end
