class FavouritesController < ApplicationController
  before_action :authenticate_and_set_user
  skip_before_action :verify_authenticity_token

  def index
    @favourites = current_user.liked_properties.all
    render json: @favourites.as_json
    rescue
      render json: {'Error': 'Must be logged in.'}.as_json
  end

  def show
    @favourite = current_user.liked_properties.all.find(params[:id])
    render json: @favourite.as_json
    rescue
      render json: {'Error': 'Some error happened or non existing favourite id.'}.as_json
  end

  def create
    if Property.all.find(property_params[:property_id])
      @liked_property = Favourite.create(user_id: current_user.id, property_id: property_params[:property_id])
    end
    render json: {'Result': 'Favourite succesfully created.'}.as_json
    rescue
      render json: {'Error': 'Unexistent Property.'}.as_json
  end

  def destroy
    @favourite_entry = current_user.favourites.all.find_by(property_id: params[:id])
    @favourite_entry.destroy
    render json: {'Result': 'Favourite deleted.'}.as_json
    rescue
      render json: {'Error': 'Some error happened or non existing favourite id.'}.as_json
  end

  private
  def property_params
    params.require(:favourite).permit(:property_id)
  end
end
