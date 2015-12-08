require 'sinatra'
require 'githubchart'

require './color.rb'

# Examples of nice colors to try out to start with:
# blue: 409ba5
# red: 720100
# green: 44a340

get '/' do
    send_file File.join(settings.public_folder, 'index.html')
end

get '/:username' do
	#default color scheme used by github
    headers 'Content-Type' => "image/svg+xml"
    username = params[:username].chomp('.svg') #Chomp off the .svg extension to be backwards compatible
    svg = GithubChart.new(user: username).svg
    stream do |out|
      out << svg
    end
end

get '/:base/:username' do
    headers 'Content-Type' => "image/svg+xml"
    username = params[:username].chomp('.svg')

    base_color = '#'+params[:base]
    scheme = ['#EEEEEE', lighten_color(base_color, 0.3), lighten_color(base_color, 0.2), base_color, darken_color(base_color, 0.8)]
    
    svg = GithubChart.new(user: username, colors: scheme).svg
    stream do |out|
      out << svg
    end
end
