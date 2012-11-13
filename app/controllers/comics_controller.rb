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

  def image
    @comic = Comic.find(params[:id])
    if @comic.image
      send_data @comic.image.data, :disposition => 'inline', :type => @comic.image.content_type
    else
      render_404
    end
  end
end
