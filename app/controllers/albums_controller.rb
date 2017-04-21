class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    render :new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
