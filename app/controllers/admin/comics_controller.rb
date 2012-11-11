class Admin::ComicsController < ApplicationController
  before_filter :authenticate_user

  def index
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def edit
    @comic = Comic.find(params[:id])
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(params[:comic])
    if @comic.save
      redirect_to(admin_comic_path(@comic), :notice => 'Comic was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @comic = Comic.find(params[:id])

    if @comic.update_attributes(params[:comic])
      redirect_to(admin_comics_url, :notice => 'Comic was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to admin_comics_url, :notice => "That comic is definitely gone..."
  end

  private
  def authenticate_user
    # if !current_user
      # redirect_to new_admin_session_url
    # end
  end
end
