include UsersHelper
include ProcategoriesHelper
ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :user, :procategory, :title, :description, :status, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

	index do
		column :title
		column t("activerecord.models.procategory") do |p|
			p.procategory.name
		end
		actions
	end

	show do |p|
		attributes_table do
			row :photo do
				image_tag(p.photo.url(:medium))
			end
			row :title
			row :user
			row :procategory
			row :description
			row :created_at
			row :updated_at
			row :status
		end
	end

	form do |f|
		f.inputs do
			f.input :procategory
			f.input :user, as: :select, :collection => staffs.map{|u| [u.email, u.id]}
			f.input :title
			f.input :description
			f.input :photo, as: :file
			f.input :status
		end
		f.actions
	end

	filter :procategory, as: :select, :collection => ordered_procategories.map{|c| [c.full_name.truncate(50), c.id]}
	filter :user, as: :select, :collection => staffs.map(&:email)
	filter :title
	filter :status
end
