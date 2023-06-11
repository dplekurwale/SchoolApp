ActiveAdmin.register StudentBatch do
  #permitted params
   permit_params :batch_id, :user_id, :status

  filter :user
  filter :status

  form do |f|
    f.inputs do
      f.input :batch_id, as: :select, collection: current_admin_user.has_role?(:admin) ? Batch.all : current_admin_user.batches
      f.input :user_id, label: 'Student', as: :select, collection: Student.all
      f.input :status
    end
    f.actions
  end
  
end
