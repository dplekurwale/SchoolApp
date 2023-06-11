class AddColumnTypeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string, default: Student
    add_column :users, :school_id, :integer
  end
end
