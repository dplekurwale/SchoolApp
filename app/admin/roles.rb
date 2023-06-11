ActiveAdmin.register Role do
  #permitted params
  permit_params :name, :resource_type, :resource_id

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
