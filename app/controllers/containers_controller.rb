class ContainersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @containers= Docker::Container.all(all: true)
    @container = Docker::Container.get(params[:id])
    @container =  @container.json
  end
  def index
    @containers = Docker::Container.all(all: true)
  end
  def create
    #Docker::Image.exist?(params[:image])
    @container = Docker::Container.create('Image' => params[:image], 'Cmd' => params[:cmd])
  end
  
  def new
    @container.create('image' => 'ubuntu')
  end
  def update
    @container = Docker::Container.get(params[:id])
    case params[:format]
    when 'start'  then @container.start
    when 'stop'   then @container.stop
    when 'delete' then @container.delete(force: true)
    end
    redirect_to containers_path
  end
end

