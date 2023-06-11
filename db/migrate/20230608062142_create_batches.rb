class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.string :name
      t.integer :school_id
      t.integer :course_id

      t.timestamps
    end
  end
end
