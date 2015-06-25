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
  	@image.remove(:force => true)
    redirect_to images_path
  end
  def new
    @image = params[:image]
    @image = Docker::Image.create('fromImage'=> params[:format])
  end 

end
