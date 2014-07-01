class DocumentsController < ApplicationController
	def index
		@documents = Document.all
		# @documents = current_user.documents
	end

	def create
			@document = Document.new document_params
			#Add document to current user  * has_and_belongs to many relationship
			@document.users << @current_user
			# @document.user = @current_user
			@document.save
			
			redirect_to @document
	end

	def new
		@document = Document.new
	end

	def edit
		@document = Document.find params[:id]
	end

	def show
		@document = Document.find params[:id]
		@users = User.all
	end

	def update
		document = Document.find params[:id]
		revision = Revision.new

		revision.document_id = document.id
		# revision.classification_id = document.classification_id
		Revision.new(document.attributes.slice('title', 'content', 'classification_id'))
		# revision.title = document.title
		# revision.content = document.content
		revision.save
		flash[:notice] = 'Revision created'	
		
		document.update document_params
		redirect_to document
	end

	def destroy
		document = Document.find params[:id]
		document.destroy
		redirect_to documents_path
	end

private
	def document_params
		params.require(:document).permit(:title, :classification_id, :content)
	end
end
