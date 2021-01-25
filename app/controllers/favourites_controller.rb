class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourites = current_user.favourites.includes(:holiday_home)
    mapped_favourites = map_to_res @favourites
    render json: mapped_favourites
  end

  def create
    @favourite = current_user.favourites.build(holiday_home_id: params[:holiday_home_id])

    if @favourite.save
      render json: @favourite
    else
      head :bad_request
    end
  end

  def update
    favourite = Favourite.find_by(id: params[:id], user: current_user)
    if favourite
      favourite.update(params[:favourite])
      render json: favourite
    else
      head :not_found
    end
  end

  def destroy
    favourite = Favourite.find_by(id: params[:id], user: current_user)
    if favourite
      favourite.destroy
      head :no_content
    else
      head :not_found
    end
  end

  private

  def map_to_res(favourites)
    favourites.map do |favourite|
      {
        holiday_home: favourite.holiday_home,
        id: favourite[:id]
      }
    end
  end
end
