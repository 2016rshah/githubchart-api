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
    headers 'Cache-Control' => "max-age=#{60*60*24}"
    headers 'Content-Type' => "image/svg+xml"

    username = params[:username].chomp('.svg')

    #Makes API backwards compatible
    if(params[:base] == "teal" || params[:base] == "halloween" || params[:base] == "dark")
        scheme = COLOR_SCHEMES[params[:base].to_sym]
    else
        scheme = COLOR_SCHEMES["light".to_sym]
    end

    svg = GithubChart.new(user: username, colors: scheme).render('svg')
    stream do |out|
      out << svg
    end
end
