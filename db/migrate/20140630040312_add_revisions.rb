class AddRevisions < ActiveRecord::Migration
  def change
  	add_column :revisions, :document_id, :integer
  	add_column :revisions, :content, :text
  	add_column :revisions, :classification_id, :integer
  	add_column :revisions, :user_id, :integer
  end
end