class ComicsController < ApplicationController
  
  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end
  
  def last
    @comic = Comic.last
    render "show"
  end
  
  def first
    @comic = Comic.first
    render "show"
  end
end
