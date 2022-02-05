class MoviesController < ApplicationController
  def index
    # @movie = Movie.order("average_vote DESC") # creates an n+1 issue
    @movies = Movie.includes(:production_company).all.order("average_vote DESC")
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
