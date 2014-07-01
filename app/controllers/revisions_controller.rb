class RevisionsController < ApplicationController
	# before_filter :authenticate_user!
	before_filter :ownership, :only => :update

	def index
		@doc = Document.find(@revision.document_id)
		@docuser = @doc.user_id
	end

	def show
		revision = Revision.find(params[:id])
		@doc = Document.find(revision.document_id)
		@docusers = @doc.users

		if @docusers.include? current_user
			@revision = revision
		else
			@revision = nil
		end	
	end

	def update
		revision = Revision.find(params[:id])
		@doc = Document.find(revision.document_id)
		@doc.title = revision.title
		@doc.update_attributes revision_params

		redirect_to document_path(@doc)
	end

private
	def revision_params
		params.require(:revision).permit(:title, :content, :document_id)
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