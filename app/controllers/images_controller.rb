class ImagesController < ApplicationController
  def index
    @images = Docker::Image.all

  end
  def show
    @image = Docker::Image.get(params[:id])
    @history = @image.history
  end
  def update
  	@image = Docker::Image.get(params[:id])
  	@image.pull
  end
  def new
    @image = Docker::Image.create(params[:id])
end 
end
