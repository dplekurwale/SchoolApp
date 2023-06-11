class AddColumnCreateByAdminUserIdToSchool < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :created_by_admin_user_id, :integer
  end
end
