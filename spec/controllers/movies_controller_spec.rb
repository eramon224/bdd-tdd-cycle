require 'spec_helper'

describe MoviesController do
  
  describe 'Finding similar movie with same director'
    before :each do
      @fake_movies = [mock("Movie"), mock("Movie")]
      @fake_movies[0].stub(:id).and_return(1)
      @fake_movies[0].stub(:director).and_return("fake_director")
      Movie.stub(:find).and_return(@fake_movies[0])
      Movie.stub(:find_by_all_director).and_return(@fake_movies)
    end

    it 'Goes to page with same directors' do
      get :similar, :id => 1
    end

    it 'Should reder similar template' do
      get :similar, :id => 1
      response.should render_template('similar')
    end
    
  describe "when the director is unknown in a movie" do
    before :each do
      # Set up a mock for a movie that has no director value
      @movie = mock("movie", {:id => "1", :title => "Iron Man", :director => nil})
      Movie.stub(:find).with("1").and_return @movie
      @movie.stub(:find_by_all_director).and_return(nil)
    end
    it "should redirect to the home page with a message saying that no movies exist" do
      get :similar, :id => '1'
      flash[:notice].should == "'#{@movie.title}' has no director info."
      response.should redirect_to('/movies')
    end
  end
  
  describe 'Creating a movie' do
    it 'creating the movie' do
      Movie.should_receive(:create!).with({"title" => 'Captain America', "rating" => 'PG', "id" => '1'}).and_return(stub_model(Movie))
      post :create, :movie => {:title => 'Captain America', :rating => 'PG', :id =>'1'}
    end
  end
  
end