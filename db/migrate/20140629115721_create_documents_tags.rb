class CreateDocumentsTags < ActiveRecord::Migration
  def change
    create_table :documents_tags do |t|
    	t.integer :tag_id
    	t.integer :document_id
    	t.timestamps
    end
  end
end
