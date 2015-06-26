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
     @parametres = params
     @container = Docker::Container.create(
      'Image' => params[:image],
      'Cmd' => params[:Cmd],
      'name' => params[:name],
      'Hostname' =>params[:hostname],
      'ExposedPorts' =>{params[:hostport].to_s+'/tcp'=>{}},
      'PortBindings'=> {params[:containerport].to_s+'/tcp'=> [{:hostip => params[:ipadress],"HostPort"=>params[:hostport]}]},
      'Env' => params[:env]).start
     redirect_to containers_path
     @containerjson = @container.json
  end

  def update
    begin
    @container = Docker::Container.get(params[:id])
     case params[:format]
     when 'start'  then @state = @container.start
     when 'stop'   then @state = @container.stop
     when 'delete' then @state = @container.delete
     end
    rescue
      #ignored
    end
    redirect_to containers_path
  end
end

