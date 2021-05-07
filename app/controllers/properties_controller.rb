class PropertiesController < ApplicationController
  before_action :authenticate_and_set_user, except: %i[index show]
  skip_before_action :verify_authenticity_token

  def index
    @properties = Property.all
    render json: @properties.as_json
  end

  def show
    @property = Property.all.find(params[:id])
    render json: @property.as_json
  rescue StandardError
    render json: { Error: 'Unexistent Property' }.as_json
  end

  def create
    if current_user.is_admin
      @property = Property.create(property_params)
      render json: { Result: 'Property succesfully created.' }.as_json
    else
      render json: { Error: 'You must be admin to create a new property.' }.as_json
    end
  rescue StandardError
    render json: { Error: 'Unexistent Property' }.as_json
  end

  def update; end

  def destroy
    @property = Property.all.find(params[:id])
    @property.destroy
    render json: { Result: 'Property deleted.' }.as_json
  rescue StandardError
    render json: { Error: 'Could not delete property.' }.as_json
  end

  private

  def property_params
    params.require(:property).permit(:title, :desc, :price, :bedrooms, :baths, :sqrmeters, :address, :img_url, :category)
  end
end
