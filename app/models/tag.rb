# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
	has_and_belongs_to_many :documents
end
