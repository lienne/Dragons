require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
    return 'Wazzah'
end

# here, :hello_form directs to the hello_form.erb file to open the page
get '/hello/' do
    erb :hello_form
end

# post here indicates we'll be receiving a form
post '/hello/' do
    greeting = params[:greeting] || "Here be dragons"
    name = params[:name] || "Nobody"

    erb :index, :locals => {'greeting' => greeting, 'name' => name}
end