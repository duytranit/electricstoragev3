include UsersHelper
include ProcategoriesHelper
ActiveAdmin.register Project do

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
		column :title
		column t("activerecord.models.procategory") do |p|
			p.procategory.name
		end
		actions
	end

	filter :procategory, as: :select, :collection => ordered_procategories.map{|c| [c.full_name.truncate(50), c.id]}
	filter :user, as: :select, :collection => staffs.map(&:email)
	filter :title
	filter :status
end
