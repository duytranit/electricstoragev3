module ProjectsHelper
	def project_be_bought(project_id, customer_id)
		@cart = current_cart(customer_id)
		flag = false
    if @cart
		  @cart.items.each do |item|
			  if item.project.id == project_id
				  flag = true
				  break
			  end
      end
    end
		return flag
	end
end