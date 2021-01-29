class HolidayHomesController < ApplicationController
  before_action :set_holiday_home, only: [:destroy]

  before_action :authenticate_user!

  def index
    holiday_homes = HolidayHome.all
    search_params = params[:search_params]
    if search_params != ''
      render json: search(search_params, holiday_homes)
    else
      render json: holiday_homes
    end
  end

  def create
    @holiday_home = current_user.holiday_homes.build(holiday_home_params)
    @holiday_home.save
    render json: @holiday_home
  end

  # DELETE /holiday_homes:id
  def destroy
    @holiday_home.destroy
    head :no_content
  end

  private

  def holiday_home_params
    params.permit(
      :title, :owner, :manager, :address, :image_url, :description, :email, :phone,
      :author, :category, :rating, :price, :image, search_params
    )
  end

  def set_holiday_home
    @holiday_home = HolidayHome.find(params[:id].to_i)
  end

  def search(search_key, holiday_homes)
    key = search_key.downcase.gsub(/\s/, '')
    result = []
    holiday_homes.each do |holiday_home|
      holiday_home_title = holiday_home.title
      holiday_home_title = holiday_home_title.downcase.gsub(/\s/, '')
      result << holiday_home if holiday_home_title == key
    end
    result
  end
end
