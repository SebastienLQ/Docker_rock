class DockerFilesController < ApplicationController
	 skip_before_action :verify_authenticity_token
  def index

  end
  def destroy 
    file = params[:id]
   @path = Pathname.pwd+"dockerfile"+file
   File.delete(@path)
   redirect_to docker_files_path
  end

  def create
      @path = Pathname.pwd+"dockerfile"+params[:Title]
      @path, @file = File.split(@path)
      @content= params[:content]
      File.open(@path+"/"+@file,"w") do |f|
        f.write(@content)
      end
       redirect_to docker_files_path
    end
end
