class HolidayHomesController < ApplicationController
  before_action :set_holiday_home, only: [:destroy]

  before_action :authenticate_user!

  def index
    render json: HolidayHome.all
  end

  def create
    holiday_home = current_user.holiday_homes.build(holiday_home_params)
    @holiday_home = holiday_home.save
    render json: @holiday_home
  end

  # DELETE /holiday_homes:id
  def destroy
    @holiday_home.destroy
    head :no_content
  end

  private

  def holiday_home_params
    params.require(:holiday_home).permit(
      :title, :owner, :manager, :address, :image_url, :description, :email, :phone, :author, :category
    )
  end

  def set_holiday_home
    @holiday_home = HolidayHome.find(params[:id].to_i)
  end
end
