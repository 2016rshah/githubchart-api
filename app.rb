require 'sinatra'
require 'githubchart'

get '/' do
    send_file File.join(settings.public_folder, 'index.html')
end


get '/:username' do
    headers 'Content-Type' => "image/svg+xml"

    username = params[:username].chomp('.svg') #Chomp off the .svg extension to be backwards compatible

    svg = GithubChart.new(user: username).svg

    stream do |out|
      out << svg
    end
end
