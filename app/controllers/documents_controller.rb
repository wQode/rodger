class DocumentsController < ApplicationController
	def index
		@documents = Document.all
		# @documents = current_user.documents
	end

	def create
		if @current_user.nil?
			@document = Document.create document_params
		else
			@document = Document.new document_params
			#Add document to current user  * has_and_belongs to many relationship
			@document.users << @current_user

			# @document.user = @current_user
			@document.save
			
			redirect_to @document
		end

		if @document.valid? 
			redirect_to @document
		else
			flash[:notice] = "Needs good title, try again"
			render :new
		end
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
		#Create a revision if the user is signed in
		@rev = Revision.create document_params

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
