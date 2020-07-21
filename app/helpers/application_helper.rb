module ApplicationHelper
	def copyright_generator
		DevcampViewTool::Renderer.copyright 'Rajkumar Das', 'All rights reserved'
	end

	def login_helper style = ''
		if current_user
     link_to 'Logout', destroy_user_session_path, class: style, method: :delete			
    else
     (link_to 'Login', new_user_session_path, class: style) + " ".html_safe +
     (link_to 'Register', new_user_registration_path, class: style)    
   	end
	end

	def nav_items
	[	
		# {
		# 	url: /edit,
		# 	title: 'Profile'
		# },
		{
			url: root_path,
			title: 'Home'
		},
		{
			url: expenses_path,
			title: 'Expenses'
		},
		{
			url: extExpenses_path,
			title: 'External Expenses'
		},
		{
			url: groups_path,
			title: 'Groups'
		}
	]
end

	def nav_helper style, tag_type
		nav_links = ''
		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
		end
		
		nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end
end
