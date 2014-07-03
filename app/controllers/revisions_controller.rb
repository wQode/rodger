class RevisionsController < ApplicationController
	def index
		@revisions = Revision.all
	end

	def show
		@revision = Revision.find params[:id]
		@document = @revision.document
		# @revision.user = @document.username

	end

	def destroy
		revision = Revision.find params[:id]
		revision.destroy
		
		flash[:notice] = "Revision is now destroyed."
		redirect_to documents_path
	end

private
	def revision_params
		params.require(:revision).permit(:title, :content, :classfication_id, :document_id)
	end
end
	# def update
	# 	@document = Document.find params[:id]
	# 	revision = Revision.new

	# 	revision.document_id = document.id
	# 	# revision.classification_id = document.classification_id
	# 	Revision.new(document.attributes.slice('title', 'content', 'classification_id'))
	# 	# revision.title = document.title
	# 	# revision.content = document.content
	# 	revision.save
	# 	flash[:notice] = 'One document revised and previous version stored'
		
	# 	document.update document_params
	# 	redirect_to document
	# end

