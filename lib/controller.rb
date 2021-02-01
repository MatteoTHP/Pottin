require 'pry'
require 'gossip'


   


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
    
  end
 
  get '/gossips/new/' do   #cree page pour entrer un gossip
    erb :new_gossip

  end

  get '/gossips/:id' do
 
    all_gossips.select do |x|
      x.id == params[:id]
    end
    puts "Hello #{params[:id]}!"
    
  end

  post '/gossips/new/' do #cree un nouveau gossip avec 2 paeametres et le sauvegarde dans un csv
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end
  
 
  
end



