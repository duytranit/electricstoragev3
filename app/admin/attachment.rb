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
		# column t("activerecord.attributes.attachment.project") do |at|
		# 	at.project.title
		# end
		column :project
		actions
	end

	filter :project
	filter :file_file_name
	filter :created_at
	filter :updated_at


end
