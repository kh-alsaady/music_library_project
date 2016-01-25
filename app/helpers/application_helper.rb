module ApplicationHelper
	def error_messages_for(object)
      render(:partial=>'/application/error_messages',:locals=>{:object=>object})
	end

	def zebra_style
		cycle('#FFFFFF','#CCCCCC')
	end
end
