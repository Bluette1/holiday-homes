require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(username: 'some_name', name: 'good name', email: 'email@gmail.com', password: 'password')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:username) }

    it 'is not valid without the minimum length of password' do
      subject.password = 'd'

      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:favourites) }
    it { should have_many(:holiday_homes) }
  end
end
