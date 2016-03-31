require 'spec_helper'
=begin
describe MoviesController do
    describe 'add director' do
        before :each do
            @m = double(Movie, :title => 'Star Wars', :director => 'director', :id => '1')
            Movie.stub(:find).with('1').and_return(@m)
        end
        it 'should call update and redirect' do
            @m.stub{:update_attributes!}.and_return(true)
            put :update, {:id => '1', :movie => @m}
            response.should redirect_to(movie_path(@m))
        end
    end
end
=end

describe MoviesController do

  describe 'finding similar movies by director'

    before :each do
      @fake_movies = [mock("Movie"), mock("Movie")]
      @fake_movies[0].stub(:id).and_return(1)
      @fake_movies[0].stub(:director).and_return("fake_director")
      Movie.stub(:find).and_return(@fake_movies[0])
      Movie.stub(:find_by_all_director).and_return(@fake_movies)
    end

    it 'redirect to same_director route' do
      get :same_director, :id => 1
    end

    it 'should select the same_director template for rendering' do
      get :same_director, :id => 1
      response.should render_template('same_director')
    end
end