require './environment'

module FormsLab
  class App < Sinatra::Base
    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end

    post "/pirates" do
      @pirate = Pirate.new(params[:pirate])
      ships_array_of_hashes= params[:pirate][:ships]
      ships_array_of_hashes.each do |ship_hash|
         Ship.new(ship_hash)
      end
      @ships = Ship.all
      erb :"pirates/show"
    end
  end
end
