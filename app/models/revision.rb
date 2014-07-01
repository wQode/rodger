# == Schema Information
#
# Table name: revisions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  document_id :integer
#

class Revision < ActiveRecord::Base
	belongs_to :document
end
