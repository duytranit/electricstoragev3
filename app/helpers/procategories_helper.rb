module ProcategoriesHelper
	def ordered_procategories
		Procategory.all.order(ddc: :asc)
	end
end