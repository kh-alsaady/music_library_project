class Cart
	attr_reader :items, :total_price

	def initialize
		empty_all_items
	end

	def add_album(album)
		existing_item = @items.find{ |item| item.album_id == album.id }
		if existing_item
			existing_item.quantity += 1
		else
			@items << LineItem.new_based_on(album)
		end
		@total_price += album.price
	end

	def remove_from_cart(album)
		existing_item = @items.find{ |item| item.album_id == album.id }
		if existing_item && existing_item.quantity > 1
			existing_item.quantity -= 1
		else
			@items.delete(existing_item)
		end
		@total_price -= existing_item.album.price if existing_item
	end

	def empty_all_items
		@items       = []
		@total_price = 0.0
	end

end
