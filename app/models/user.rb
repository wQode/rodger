# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  avatar          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#  email           :string(255)
#

class User < ActiveRecord::Base
	has_secure_password
	
	has_and_belongs_to_many :documents
	has_many :classifications

	# Checks, validates the username
	validates :username, :presence => true, :length => { :minimum => 3 }
	# has_many :documents
	# validates :image, :presence => true
end
