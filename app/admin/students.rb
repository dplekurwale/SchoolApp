ActiveAdmin.register Student do
  menu priority: 3
  
  #permitted params
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :type, :school_id, :name, :provider, :uid, :allow_password_change, :tokens
  
  index do
    selectable_column
    id_column
    column :email
    column :name
    column :provider
    column :school_id
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :school_id, as: :select, collection: current_admin_user.has_role?(:admin) ? School.all : current_admin_user.schools
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
