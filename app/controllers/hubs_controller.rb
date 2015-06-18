class HubsController < ApplicationController
    def index
        @containers = Docker::Container.all(all: true)
    end
end
