class Artist < ActiveRecord::Base
	#Relationships
	has_many :albums
	
	#Validations
	validates :name,
			  :presence=>true
	validates :active_year,
			  :presence=>true
end
