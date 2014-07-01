# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Classification < ActiveRecord::Base
	belongs_to :user
	has_many :documents
end
