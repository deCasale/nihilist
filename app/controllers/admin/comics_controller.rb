class Admin::ComicsController < ApplicationController
  before_filter :authenticate_user
  before_filter :extract_image, :only => [:create, :update]
  before_filter :find_comic, :only => [:show, :edit, :update, :destroy]

  def index
    @comics = Comic.all
  end

  def show
  end

  def edit
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(params[:comic])
    @comic.image = @image if @image
    if @comic.save
      redirect_to(admin_comic_path(@comic), :notice => 'Comic was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @comic.update_attributes(params[:comic])
      redirect_to(admin_comics_url, :notice => 'Comic was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @comic.destroy
    redirect_to admin_comics_url, :notice => "That comic is definitely gone..."
  end

  private

  def authenticate_user
    if !current_user
      redirect_to admin_login_path
    end
  end

  def extract_image
    @image = params[:comic].delete :image if params[:comic]
  end

  def find_comic
    @comic = Comic.find_by_slug_or_id(params[:id])
  end

end
