class User < ActiveRecord::Base


	#Validations
	validates :username,
			  :presence=>true,
			  :uniqueness=>true
	validates :password,
			  :presence=>true

	#Use blowfish hash to encrypt password
	has_secure_password

end
