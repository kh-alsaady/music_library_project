class Customer < ActiveRecord::Base
	#Vaildations
	has_many :orders
	#Scopes
	scope :sort,lambda{ order("first_name,last_name ASC") }

	#Methodes
	def name
		first_name + " " + last_name
	end

	#Validations
	validates :first_name,
			  :presence=>true
	validates :last_name,
			  :presence=>true	
	validates :zip_code,
			  :presence=>true			  		 
end
