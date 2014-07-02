class PagesController < ApplicationController
  	layout 'homepage'

  	def homepage
  	end

 	 # def create
  	# end
	# def searcher
	# 	search = params[:search]
	# 	@results = Document.where("title ILIKE :search", search: "%#{ search }%")
	# end
end
  # search_condition = "%" + search + "%"
  # find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])