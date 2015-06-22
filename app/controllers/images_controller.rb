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
    @image = params[:image]
    @image = Docker::Image.create('fromImage'=> params[:image], 'repo' => params[:format].split('/')[0], 'Names' => params[:format])
  end 

end
