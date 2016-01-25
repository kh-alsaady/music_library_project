class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index  	
  end
  
  def login
  end
  
  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = User.where(:username => params[:username]).first
  		if found_user
				authenticated_user = found_user.authenticate(params[:password])
				if authenticated_user
					session[:user_id] = authenticated_user.id
					session[:username] = authenticated_user.username
					flash[:notice] = 'you logged in successfully.'
					redirect_to(:action => 'index')
				else
				flash[:notice] = 'Incorrect username and password combination.'
				render('login')
				end
			else
				flash[:notice] = 'Incorrect username and password combination.'
				render('login')
  		end
  	else
  		flash[:notice] = "Enter username and password first."
  		render('login')
  	end
  end

	def logout
		session[:user_id]  = nil
		session[:username] = nil
		flash[:notice] = 'you now logged out successfully.'		
		redirect_to(:action => 'login')
	end

	private #-------------------------------------------------------------

end
