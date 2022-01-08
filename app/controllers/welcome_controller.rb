class WelcomeController < ApplicationController
  def index
  	begin
	    @containers = Docker::Container.all(all: true)
	    @infos = Docker.version
	# rescue
	# 	redirect_to error_path('serveur docker unjoinable')
	end
  end
end
