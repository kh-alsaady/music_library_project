class Feature < ActiveRecord::Base
	#Relationships
	has_and_belongs_to_many :albums

	#Validations
	validates :name,
			  :presence=>true
	
end
