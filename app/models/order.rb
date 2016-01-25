class Order < ActiveRecord::Base
	#Relationships
	has_many   :line_items
	belongs_to :customer
	
	#Scopes
	scope :sort, lambda{order("created_at ASC")}
	#Validations
	
end
