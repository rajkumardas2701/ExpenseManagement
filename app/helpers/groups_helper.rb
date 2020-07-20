module GroupsHelper
	def image_generator1
		"https://www.uffizio.com/images/product/taskeye/expense-management.svg"
	end

	def group_img img
		if img
			img
		else
			image_generator1
		end
	end

end
