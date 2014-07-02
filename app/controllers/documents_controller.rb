class DocumentsController < ApplicationController
	def index
		@documents = Document.all

		@revisions = Revision.all
	end

	def create
			@document = Document.new document_params
			#Add document to current user  * has_and_belongs to many relationship
			@document.users << @current_user
			@document.creator = @current_user
			@document.save
	
			redirect_to @document
	end

	def new
		@document = Document.new
	end

	def edit
		@document = Document.find params[:id]
		@revision = Revision.new
		# @revision = Revision.find params[:id]
	end

	def show
		@document = Document.find params[:id]
		@users = User.all
	end

	def update
		document = Document.find params[:id]
		revision = Revision.new(document.attributes.slice('title', 'content', 'classification_id'))

		revision.document_id = document.id
		revision.user_id = @current_user.id

		document.revisions << revision

		if document.update document_params
			flash[:notice] = 'One document revised and previous version stored'
			redirect_to document
		else
			render :edit
		end
	end

	def destroy
		document = Document.find params[:id]
		document.destroy

		revision = Revision.find params[:id]
		revision.destroy
		
		redirect_to documents_path
	end

private
	def document_params
		params.require(:document).permit(:title, :classification_id, :content)
	end

	def revision_params
		params.require(:revision).permit(:title, :content, :classfication_id, :document_id)
	end
end
