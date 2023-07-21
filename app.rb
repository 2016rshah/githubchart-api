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
    headers 'Cache-Control' => "max-age=#{60*60*24}"

    username = params[:username].chomp('.svg') #Chomp off the .svg extension to be backwards compatible
    svg = GithubChart.new(user: username).render('svg')
    stream do |out|
      out << svg
    end
end


get '/:base/:username' do
	# Custom color scheme, with default background
    headers 'Cache-Control' => "max-age=#{60*60*24}"
    headers 'Content-Type' => "image/svg+xml"

    username = params[:username].chomp('.svg')

    #Makes API backwards compatible
    if(params[:base] == "teal" || params[:base] == "halloween" || params[:base] == "default")
        scheme = COLOR_SCHEMES[params[:base].to_sym]
    else
        #this case will be executed a majority of the time
        base_color = '#'+params[:base]
        scheme = ['#EEEEEE', lighten_color(base_color, 0.3), lighten_color(base_color, 0.2), base_color, darken_color(base_color, 0.8)]
    end

    svg = GithubChart.new(user: username, colors: scheme).render('svg')
    stream do |out|
      out << svg
    end
end


get '/:base/:background/:username' do
	# Custom color scheme, with custom background
    headers 'Cache-Control' => "max-age=#{60*60*24}"
    headers 'Content-Type' => "image/svg+xml"

    username = params[:username].chomp('.svg')

    #Makes API backwards compatible
    if(params[:base] == "teal" || params[:base] == "halloween" || params[:base] == "default")
        scheme = COLOR_SCHEMES[params[:base].to_sym]
    else
        #this case will be executed a majority of the time
        base_color = '#'+params[:base]
	background_color = '#'+params[:background]
        scheme = [background_color, lighten_color(base_color, 0.3), lighten_color(base_color, 0.2), base_color, darken_color(base_color, 0.8)]
    end

    svg = GithubChart.new(user: username, colors: scheme).render('svg')
    stream do |out|
      out << svg
    end
end
