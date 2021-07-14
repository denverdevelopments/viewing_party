require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships)}
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe "#instance methods" do 
    before(:each) do
      @movie = VCR.use_cassette("movie_details_by_id") do
        MovieFacade.movie_details_by_id(337404)
      end
      @user = create(:mock_user)
      @friend = create(:mock_user)
      @friend_2 = create(:mock_user)
      @party = create(:mock_party, host_id: @friend.id, movie_id: @movie.id)
      @party_guests = create(:mock_party_guest, party_id: @party.id, guest: @user )
      @party_2 = create(:mock_party, host_id: @friend_2.id, movie_id: @movie.id)
      @party_guests_2 = create(:mock_party_guest, party_id: @party_2.id, guest: @user )
    end

    describe "#find_party_guests_user" do 
      it "returns all party guest relationships where user is a guest" do
    
        expect(@user.find_party_guests_user).to eq([@party_guests, @party_guests_2])
      end
    end

    describe "#invited_parties" do
      it "returns all parties that user is invited to" do

        expect(@user.invited_parties).to eq([@party, @party_2])
      end
    end
  end
end
