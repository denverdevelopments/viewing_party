require 'rails_helper'

RSpec.describe "Movies show page" do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    service = MovieService.new
    movie = VCR.use_cassette("tmdb_find_movie_by_movie_id") do
      service.find_by_id(337404)
    end

    cast = VCR.use_cassette("tmdb_find_cast_by_movie_id") do
      service.find_cast(337404)
    end

    reviews = VCR.use_cassette("tmdb_find_reviews") do
      service.find_reviews(337404)
    end
    @cruella = MovieDetails.new(movie, cast, reviews)

    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"

    visit movie_path(@cruella.id)
  end

  describe 'Movie Show Page' do
    it 'has a button to create a viewing party' do

      expect(page).to have_button("Create Viewing Party")
    end

    it 'shows movie title and its details' do

      expect(page).to have_content(@cruella.title)
      expect(page).to have_content("8.4")
      expect(page).to have_content(@cruella.runtime)
      expect(page).to have_content("Comedy")
      expect(page).to have_content("Crime")
    end

    it 'shows movie overview' do

      expect(page).to have_content(@cruella.overview)
    end

    it 'lists the first 10 members of the cast' do

      expect(page).to have_content("Emma Stone as Estella / Cruella")
      expect(page).to have_content("Kayvan Novak as Roger")
    end

    it 'lists number of reviews and review content' do

      expect(page).to have_content("Emma Stone as Estella / Cruella")
      expect(page).to have_content("Kayvan Novak as Roger")
    end
  end
end
