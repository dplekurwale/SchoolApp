ActiveAdmin.register AdminUser do
  menu priority: 2
  menu :if => proc { current_admin_user.has_role? :admin }

  permit_params :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :roles do |admin_user|
      admin_user.roles.pluck(:name).join(',')
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :roles, as: :check_boxes, collection: Role.all
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      if params[:admin_user][:password].blank?
        params[:admin_user].delete "password"
        params[:admin_user].delete "password_confirmation"
      end

      super
    end
  end

end
