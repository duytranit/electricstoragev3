module ProjectsHelper
	def project_be_bought(project_id)
		if session[:storage]
			flag = false
			session[:storage].each do |id|
				if id == project_id.to_s()
					flag = true
					break
				end
			end
			return flag
		else
			return false
		end
	end
end