class DockerFilesController < ApplicationController
	 skip_before_action :verify_authenticity_token
  def index

  end
  def destroy 
    Pathname("/Users/sebastien/docker_clean/dockerfile/"+file).delete
  end

  def create
  	@Title = params[:Title].to_s
  	@content= params[:content]
  	@path = @pwd.to_s+"/dockerfile"
  	File.open("/Users/sebastien/docker_clean/dockerfile/"+@Title,"w") do |f|
  		f.write(@content)
  	end
  end

end
