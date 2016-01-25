class Album < ActiveRecord::Base
	#Relationships
	belongs_to :artist
	has_and_belongs_to_many :features
	has_many :line_items
	
	#Scopes
	scope :sort,lambda{order("release_date ASC")}
	
	#Validations
	validates :title,
			  :presence=>true
	validates :release_date,
			  :presence=>true
	validates :artist_id,
			  :presence=>true
    validate  :default_price

    private #-------------------------------------------------------------
    
    def default_price
	    self.price = 0.0  if price.blank?
    end
			  
end
