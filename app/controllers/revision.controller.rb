class RevisionController < ApplicationController
def index
		@revisions = Revision.all
	end

	def show
		@revision = Revision.find params[:id]
	end

	def update
		revision = Revision.new

		revision.document_id = document.id
		# revision.classification_id = document.classification_id
		Revision.new(document.attributes.slice('title', 'content', 'classification_id'))
		# revision.title = document.title
		# revision.content = document.content
		revision.save
		flash[:notice] = 'One document revised and previous version stored'
		
		document.update document_params
		redirect_to document
	end

	def destroy
		revision = Revision.find params[:id]
		revision.destroy
		
		redirect_to documents_path
	end

private
	def revision_params
		params.require(:revision).permit(:title, :content, :classfication_id, :document_id)
	end
end