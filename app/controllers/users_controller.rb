class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.movies.order(start_time: :desc)
  end
end
