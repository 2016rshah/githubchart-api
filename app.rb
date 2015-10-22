require 'sinatra'
require 'githubchart'

get '/' do
    send_file File.join(settings.public_folder, 'index.html')
end


get '/:username' do
    headers 'Content-Type' => "image/svg+xml"

    svg = GithubChart.new(user: params[:username]).svg

    stream do |out|
      out << svg
    end
end
