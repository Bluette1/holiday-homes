class HolidayHomesController < ApplicationController
  before_action :set_holiday_home, only: [:destroy]

  before_action :authenticate_user!

  def index
    holiday_homes = HolidayHome.all.includes(:creator)
    search_params = params[:search_params]
    if search_params != ''
      render json: map_to_res(search(search_params, holiday_homes))
    else
      render json: map_to_res(holiday_homes)
    end
  end

  def create
    @holiday_home = current_user.holiday_homes.build(holiday_home_params)

    if @holiday_home.save
      render json: @holiday_home
    else
      render json: @holiday_home.errors, status: :unprocessable_entity
    end
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
      :author, :category, :rating, :price, :image
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

      Regexp.new(key).match(holiday_home_title)
      result << holiday_home unless Regexp.new(key).match(holiday_home_title).nil?
    end
    result
  end

  def map_to_res(holiday_homes)
    holiday_homes.map do |holiday_home|
      {
        holiday_home: holiday_home,
        creator: holiday_home.creator
      }
    end
  end
end
