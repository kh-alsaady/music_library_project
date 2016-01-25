class UsersController < ApplicationController
  #Callbacks methods
  before_action :confirm_logged_in
	before_action :set_user, :only=>[:edit,:update,:delete,:destroy]

  def new
  	@user=User.new()
  end
	
	def create
		@user=User.new(user_params)
		if @user.save
			flash[:notice]="User was created successfully."
			redirect_to(users_path)
		else
			render(:action=>'new')
		end
	end
  
  def index
  	@users=User.all
  end

  def edit  
  end

	def update
    if @user.update_attributes(user_params)
      flash[:notice]="User was updated successfully."
      redirect_to(users_path)
    else
      render(:action=>'edit')
    end
	end

  def delete
  end

  def destroy
      @user=User.find(params[:id]).destroy
      flash[:notice]="User was deleted successfully."
      redirect_to(users_path)
  end

  private #--------------------------------------------------------

  def set_user
		@user=User.find(params[:id])
  end

  def user_params
		params.require(:user).permit(:username,:password,:password_confirmation)
  end
end
