class AddUniqueIndexToBatchStudents < ActiveRecord::Migration[7.0]
  def change
    add_index :student_batches, [:user_id, :batch_id], unique: true
  end
end
