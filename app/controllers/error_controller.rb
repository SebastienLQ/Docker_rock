class ErrorController < ApplicationController
	def show
		@error = params[:id]
	end
end
