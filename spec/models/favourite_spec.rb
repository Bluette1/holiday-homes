require 'rails_helper'

RSpec.describe Favourite, type: :model do
  describe 'Validations' do
    let(:favourer) do
      User.create(username: 'favourer', name: 'Good Name', email: 'email@gmail.com', password: 'password')
    end
    let(:creator) do
      User.create(username: 'creator', name: 'Good Creator', email: 'myemail@gmail.com', password: 'password')
    end
    let(:holiday_home) do
      HolidayHome.create(
        title: 'some text', creator_id: creator.id, category: 'category',
        rating: 3, price: 400, address: 'address'
      )
    end

    subject do
      described_class.new(user_id: favourer.id, holiday_home_id: holiday_home.id)
    end

    it 'A valid favourite should be successfully saved' do
      expect(subject).to be_valid
    end

    it 'should validate uniqueness of user -> scope holiday_home' do
      described_class.create(user_id: favourer.id, holiday_home_id: holiday_home.id)
      expect(subject).not_to be_valid
      expect(subject.errors.full_messages).to eq ['User has already been taken']
    end
  end

  describe 'Associations' do
    it { should belong_to(:holiday_home) }
    it { should belong_to(:user) }
  end
end
