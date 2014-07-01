module ApplicationHelper
	def login_nav
		links = ''
		if @current_user.try(:is_admin)
			links += "<li>" + link_to('View users', users_path) + "</li>"
		end
		
		if @current_user.present?
			links += "<li>"
       		links += link_to('new', new_document_path)
       		links += link_to('index', documents_path)
       		links += link_to('classifications', classifications_path)
       		links += "</li>"
		else
			links += "<li>#{ link_to('Sign up', new_user_path) }</li>"
			links += "<li>#{ link_to('Sign in', login_path) }</li>"
		end
	end

	def logout_nav
		links = ''

		if @current_user.present?
			links += "<li>"
       		links += link_to('Logout ' + @current_user.username, login_path, :data => {:method => :delete, :confirm => 'Really logout?'})
       		links += "<li>"
       	end
   end
end

