class FeaturesController < ApplicationController
  #callbacks
  before_action :confirm_logged_in
  before_action :set_feature,:only=>[:show,:edit,:update,:delete,:destroy]

  def index
    @features=Feature.all
  end

  def show
  end

  def new
    @feature=Feature.new()
  end

  def create
    @feature=Feature.new(feature_params)
    if @feature.save
      flash[:notice]="Feature was successfully created"
      redirect_to(features_path)
    else
      render('new')
    end

  end

  def edit
  end

  def update
    if @feature.update_attributes(feature_params)
      flash[:notice]="feature was successfully updated."
      redirect_to(feature_path(@feature.id))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @feature.destroy
    flash[:notice]="feature was successfully deleted."
    redirect_to(features_path)
  end

  private #----------------------------------------

  def set_feature
    @feature=Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name)
  end
end
