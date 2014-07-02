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

   #  def markdown(text)  
   #  	Redcarpet.new(text).to_html.html_safe  
  	# end 

	# def markdown(text)
	#   options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
	#   syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
	# end

	# def syntax_highlighter(html)
	#   doc = Nokogiri::HTML(html)
	#   doc.search("//pre[@lang]").each do |pre|
	#     pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
	#   end
	#   doc.to_s
	# end
end

