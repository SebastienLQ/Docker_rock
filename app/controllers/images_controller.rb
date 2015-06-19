class ImagesController < ApplicationController
  def index
    @images = Docker::Image.all

  end
  def show
    @image = Docker::Image.get(params[:id])
    @history = @image.history
  end
end
