class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.search_for(params[:q])
	end

  def new
    @movie = Movie.new
  end
   
  def create
  
  @movie = Movie.new(new_movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie was created!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update new_movie_params
      redirect_to @movie, notice: "Movie was updated!"
      else
        render 'edit'
      end
  end
  
  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def new_movie_params
    params.require(:movie).permit(:title, :description, :year_released)
  end


end
