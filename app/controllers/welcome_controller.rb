class WelcomeController < ApplicationController
  def index
    @containers = Docker::Container.all(all: true)
    @infos = Docker.version
  end
end
