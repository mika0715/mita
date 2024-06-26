class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, except: [:index, :new, :create]
  before_action :contributor_confirmation, except: [:index, :new, :create]

  def index
    @movies = current_user.movies
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

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @movie.destroy
      redirect_to root_path
    else
      redirect_to movie_path(@Movie)
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :memo, :theater_id, :expense, :start_time, :image).merge(user_id: current_user.id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def contributor_confirmation
    if current_user != @movie.user
      redirect_to new_user_session_path
    end
  end
end