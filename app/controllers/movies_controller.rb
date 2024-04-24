class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :memo, :theater_id, :expense, :start_time, :image).merge(user_id: current_user.id)
  end
end