class SearchController < ApplicationController
skip_before_action :verify_authenticity_token
  def create       
    @containers = params[:format]
    @search = Docker::Image.search('term' => params[:image])
    #Docker::Container.create('Image' => params[:image], 'Cmd' => params[:cmd])
  end

end
