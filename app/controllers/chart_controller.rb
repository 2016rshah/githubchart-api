class ChartController < ApplicationController

	def index
	end

	def generate
    svg = GithubChart.new(user: params["username"]).svg
		respond_to do |format|
			format.svg { render inline: svg}
		end 
  end
end
