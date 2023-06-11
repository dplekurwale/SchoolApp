class CreateStudentBatches < ActiveRecord::Migration[7.0]
  def up
    create_table :student_batches do |t|
      t.integer :batch_id
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end

  def down
    drop_table :student_batches
  end
end
