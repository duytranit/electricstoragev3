module UsersHelper
	def staffs
		return User.where(["role = 'staff'"])
	end
end