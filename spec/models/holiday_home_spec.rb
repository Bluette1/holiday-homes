require 'rails_helper'

RSpec.describe HolidayHome, type: :model do
  describe 'Validations' do
    let(:creator) do
      User.create(username: 'creator', name: 'Good Author', email: 'email', password: 'password')
    end
    let(:subject) do
      described_class.new(title: 'some text', creator: creator, rating: 3, category: 'Mansion', price: 1000)
    end
    it 'is not valid without a creator' do
      subject.creator = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:rating) }
  end

  describe 'Associations' do
    it { should belong_to(:creator) }
    it { should have_many(:favourites) }
  end
end
