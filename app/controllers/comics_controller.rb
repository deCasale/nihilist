class ComicsController < ApplicationController
  
  def index
    @comics = Comic.all
  end

  def show
    if params[:id].blank?
      @comic = Comic.last
    else
      @comic = Comic.find_by_slug_or_id(params[:id])
    end
  end

  def image
    @comic = Comic.find_by_slug_or_id(params[:id])
    if @comic.image
      send_data @comic.image.data, :disposition => 'inline', :type => @comic.image.content_type
    else
      render_404
    end
  end
end
