class RevisionsController < ApplicationController
	# before_filter :authenticate_user!
	before_filter :ownership, :only => :update

	def index
		@revisions = Revision.find(:all, :conditions => {:document_id => params[:document_id]} )
		# @doc = Document.find(@revision.document_id)
		# @docuser = @doc.user_id
	end

	def create
		@revision = Revision.new revision_params
		@revision.document_id = params[:document_id]
		@revision.user_id = current_user.id

		@revision.save
		flash[:notice] = 'Revision created'	

		redirect_to @document
	end

	def new
		@revision = Revision.new
		@revision.document_id = params[:document_id]
		# @revision.classification_id = document.classification_id
	end

	def edit
		@revision = Revision.find(params[:id])
	end

	def show
		if params[:id] == 'current'
			@revision = Document.find(params[:document_id]).current_revision
		else
			@revision = Revision.find(params[:id])
		end		
		# @doc = Document.find(revision.document_id)
		# @docusers = @doc.users
		# @revision = revision
	end

	def update
		revision = Revision.find(params[:id])
		if @revision.update_attributes(params[:revision])
			flash[:notice] = 'Revision updated'
		# @doc = Document.find(revision.document_id)
		# @doc.title = revision.title
		# @doc.update_attributes revision_params
		else
			revision.update revision_params
			flash[:notice] = 'Revision updated'
		end
		redirect_to document_path(@doc)
	end

	def destroy
		@revision = Revision.find(params[:id])
		@revision.destroy
		redirect_to documents_path
	end

private
	def revision_params
		params.require(:revision).permit(:title, :content, :classfication_id, :document_id)
	end

	# Checks if the doc users include the current suer and sets instance variables
	# Can access revisions if the document.user_id == current_user
	def ownership
		revision = Revision.find(params[:id])
		@doc = Document.find(revision.document_id)
		@docusers = Document.find(revision.document_id).users
		@docusers.include? current_user
	end
end