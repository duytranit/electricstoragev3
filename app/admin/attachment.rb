ActiveAdmin.register Attachment do
	menu priority: 3

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
	index do
		column :file_file_name
		column :file_content_type
		column :project
		actions
	end

	filter :project
	filter :file_file_name
	filter :created_at
	filter :updated_at

	form do |f|
		f.inputs do
			f.input :project, as: :select, collection: Project.all.map {|p|[p.title, p.id]}
			f.input :file, as: :file
		end
		f.actions
	end

	show do |at|
		attributes_table do
			row :id
			row :project
			row :created_at
			row :updated_at
			row :file_file_name
			row :file_content_type
			row :file_file_size
		end
	end


end
