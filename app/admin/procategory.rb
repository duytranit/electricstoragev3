ActiveAdmin.register Procategory do
	menu priority: 2
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
	index do |pc|
		column :ddc
		column :name
		column :status
		actions
	end

	show do |pc|
		attributes_table do
			row :id
			row :ddc
			row :name
			row :description
			row :created_at
			row :updated_at
			row :status
			# row :projects do
			# 	pc.projects.map(&:title).join(" | ")
			# end
			row :projects do |pc|
				pc.projects.each.map(&:title).join(' | ')
			end
		end

	end


end
