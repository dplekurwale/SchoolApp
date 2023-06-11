ActiveAdmin.register School do
  scope_to :current_admin_user, :if => proc { !current_admin_user.has_role? :admin }
  menu priority: 4

  #permitted params
  permit_params :name, :address, :created_by_admin_user_id

  #filter
  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.hidden_field :created_by_admin_user_id, value: current_admin_user.id
    end
    f.actions
  end
end
