require 'rails_helper'

require 'support/devise_config'

RSpec.describe FavouritesController, type: :controller do
  describe 'post favourite' do
    log_in_usr :creator, 'jane', 'jane@gmail.com', 'jenny_creator'

    it 'successfully creates a favourite holiday home' do
      creator = User.find_by(name: 'jane', email: 'jane@gmail.com')
      request.headers['Authorization'] = creator.authentication_token
      holiday_home = HolidayHome.create({
                                          creator: creator, title: 'some title',
                                          rating: 3, category: 'Mansion', price: 1000, address: 'address'
                                        })

      post :create, params: { holiday_home_id: holiday_home.id }

      expect(response.code).to eq '200'
    end

    it 'fails to post a favourite and returns an authorization error - invalid headers' do
      creator = User.find_by(name: 'jane', email: 'jane@gmail.com')
      request.headers['invalidHeaders'] = creator.authentication_token
      holiday_home = HolidayHome.create({
                                          creator: creator, title: 'some title',
                                          rating: 3, category: 'Mansion', price: 1000, address: 'address'
                                        })

      post :create, params: { holiday_home_id: holiday_home.id }

      expect(response.code).to eq '401'
    end

    it 'fails to post a favourite and returns an authorization error - incorrect token' do
      creator = User.find_by(name: 'jane', email: 'jane@gmail.com')
      request.headers['Authorization'] = 'invalid token'

      holiday_home = HolidayHome.create({
                                          creator: creator, title: 'some title',
                                          rating: 3, category: 'Mansion', price: 1000, address: 'address'
                                        })

      post :create, params: { holiday_home_id: holiday_home.id }

      expect(response.code).to eq '401'
    end
  end

  describe 'retrieves holiday homes' do
    log_in_usr :creator, 'jane', 'jane@gmail.com', 'jenny_creator'

    it 'successfully creates available holiday homes' do
      creator = User.find_by(name: 'jane', email: 'jane@gmail.com')
      holiday_home = HolidayHome.create({
                                          creator: creator, title: 'some title',
                                          rating: 3, category: 'Mansion', price: 1000, address: 'address'
                                        })

      Favourite.create({ user: creator, holiday_home: holiday_home })

      request.headers['Authorization'] = creator.authentication_token

      get :index, params: {}
      expect(response.code).to eq '200'
    end
  end
end
