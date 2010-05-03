class MoviesController < ApplicationController
  def create
    puts params.inspect
    @movie = Movie.new(params[:movie])
    puts @movie
    @movie.save
  end
end
