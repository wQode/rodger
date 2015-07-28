# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  pagenumber :integer
#

class Document < ActiveRecord::Base
	belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id'
	has_and_belongs_to_many :users
	belongs_to :classification
	has_many :revisions
	has_and_belongs_to_many :tags
	# Checks for valid title
	validates :title, :presence => true
end
