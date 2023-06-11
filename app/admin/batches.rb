ActiveAdmin.register Batch do
  #permitted params
  permit_params :name, :school_id, :course_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :school_id, as: :select, collection: current_admin_user.has_role?(:admin) ? School.all : current_admin_user.schools
      f.input :course_id, as: :select, collection: current_admin_user.has_role?(:admin) ? Course.all : current_admin_user.courses
    end
    f.actions
  end
  
end
