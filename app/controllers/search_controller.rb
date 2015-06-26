class SearchController < ApplicationController
skip_before_action :verify_authenticity_token
  def create 
  begin      
	    @containers = params[:format]
	    @search = Docker::Image.search('term' => params[:image])
  rescue
  	redirect_to error_path(' internet is unreachable ')
    #Docker::Container.create('Image' => params[:image], 'Cmd' => params[:cmd])
	end
  end

end
