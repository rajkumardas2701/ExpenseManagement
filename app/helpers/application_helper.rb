module ApplicationHelper
	def copyright_generator
		DevcampViewTool::Renderer.copyright 'Rajkumar Das', 'All rights reserved'
	end
end
