require 'sinatra'
require 'githubchart'

COLOR_SCHEMES = {
    default: ['#eeeeee', '#d6e685', '#8cc665', '#44a340', '#1e6823'],
    halloween: ['#EEEEEE', '#FFEE4A', '#FFC501', '#FE9600', '#03001C'],
    teal: ['#EEEEEE', "#7FFFD4", "#76EEC6", "#66CDAA", "#458B74"],
    red: ['#EEEEEE', '#990100', '#8C0100', '#720100', '#4C0100']
}

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

get '/:scheme/:username' do
	#example: ghchart.rshah.io/teal/2016rshah
	#if scheme is not recognized, it will bounce back to the default color scheme
	headers 'Content-Type' => "image/svg+xml"
    username = params[:username].chomp('.svg')
    scheme = COLOR_SCHEMES[params[:scheme].to_sym] #must correspond to the color schemes specified above
    svg = GithubChart.new(user: username, colors: scheme).svg
    stream do |out|
      out << svg
    end
end
