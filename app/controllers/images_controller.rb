class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @images = Docker::Image.all

  end

 def show
   @image = Docker::Image.get(params[:id])
   @history = @image.history
 end

 def create
   if params[:format] == "rename"
    @image = Docker::Image.get(params[:id])
    @image.tag('repo' => params[:name], 'force' => true)
  else
    @path = Pathname.pwd+"dockerfile"+params[:file]
    @path, @file = File.split(@path)
    File.open(@path+"/"+@file,"r") do |f|
      @content = f.read
    end
    begin
      image = Docker::Image.build(@content)
      image.tag('repo' => "sebidouille/"+params[:file], 'force' => true)
    rescue
      #redirect_to error_path("ta soeur elle s'achete une connexion ?")
      flash[:notice] = "po marché bouhhhhhhh"
    end
  end

 end

  def update
  	@image = Docker::Image.get(params[:id])
    case params[:format]
    when 'delete' then @image.remove(:force => true)
    when 'rename' then @image.tag('repo' => params[:name], 'force' => true)
    end
    redirect_to images_path
  end

  def new
    @image = params[:image]
    @image = Docker::Image.create('fromImage'=> params[:format])
    @image.tag('repo' => "sebidouille/"+params[:format], 'force' => true)
    #redirect_to containers_path
  end 

end
