class RenameApprovedToStatusInStudentBatches < ActiveRecord::Migration[7.0]
  def up
    change_column :student_batches, :approved, :integer, default: 0
    rename_column :student_batches, :approved, :status
  end

  def down
    rename_column :student_batches, :status, :approved
    change_column :student_batches, :approved, :string
  end
end
