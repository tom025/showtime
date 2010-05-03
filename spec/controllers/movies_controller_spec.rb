require 'spec_helper'

describe MoviesController do

  #Delete this example and add some real ones
  it "should use MoviesController" do
    controller.should be_an_instance_of(MoviesController)
  end

  it "creates a new movie" do
    movie = mock_model(Movie).as_new_record
    Movie.stub(:new).and_return movie
    movie.stub(:save).and_return true
    Movie.should_receive(:new).with(
      "title" => "Caddyshack",
      "release_year" => 1980,
      "genre" => 2
    )

    post :create, :movie => {
      "title" => "Caddyshack",
      "release_year" => 1980,
      "genre" => 2
    }
  end

  it "saves the movie" do
    movie = mock_model(Movie).as_new_record
    Movie.stub(:new).and_return movie
    movie.should_receive(:save)
    post :create
  end
end
