class AddDocuments < ActiveRecord::Migration
  def change
  	add_column :documents, :user_id, :integer
  	add_column :documents, :classification_id, :integer
  end
end
