require 'rails_helper'

require 'support/devise_config'

RSpec.describe HolidayHomesController, type: :controller do
  describe 'post holiday home' do
    log_in_usr :creator, 'jane', 'jane@gmail.com', 'jenny_creator'

    it 'successfully creates a holiday home' do
      creator = User.find_by(name: 'jane', email: 'jane@gmail.com')
      request.headers['Authorization'] = creator.authentication_token

      post :create, params: { title: 'some title', rating: 3, category: 'Mansion', price: 1000, address: 'address' }
      expect(response.code).to eq '200'
    end

    it 'fails to post a holiday home and returns an authorization error - invalid headers' do
      creator = User.find_by(name: 'jane', email: 'jane@gmail.com')
      request.headers['InvalidHeaders'] = creator.authentication_token

      post :create, params: { title: 'some title', rating: 3, category: 'Mansion', price: 1000, address: 'address' }
      expect(response.code).to eq '401'
    end

    it 'fails to post a holiday home and returns an authorization error - incorrect token' do
      request.headers['Authorization'] = 'invalid token'

      post :create, params: { title: 'some title', rating: 3, category: 'Mansion', price: 1000, address: 'address' }
      expect(response.code).to eq '401'
    end
  end

  describe 'retrieves holiday homes' do
    log_in_usr :creator, 'jane', 'jane@gmail.com', 'jenny_creator'
    creator = User.find_by(name: 'jane', email: 'jane@gmail.com')

    it 'successfully creates available holiday homes' do
      HolidayHome.create({
                           creator: creator, title: 'some title',
                           rating: 3, category: 'Mansion', price: 1000, address: 'address'
                         })

      request.headers['Authorization'] = creator.authentication_token

      post :index, params: { search_params: '' }
      expect(response.code).to eq '200'
    end
  end
end
