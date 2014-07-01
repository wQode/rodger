# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  content           :text
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer
#  classification_id :integer
#

class Document < ActiveRecord::Base
	# belongs_to :user
	has_and_belongs_to_many :users
	belongs_to :classification
	has_many :revisions
	has_and_belongs_to_many :tags
	# Checks for valid title
	validates :title, :presence => true
end
