class ApplicationController < Sinatra::Base
  #set content-type header
  set :default_content_type, "application/json"

  # add routes
  get "/bakeries" do 
    #get all the bakeries from db
    bakeries = Bakery.all
    #send data back as JSON array
    bakeries.to_json
  end

  get "/bakeries/:id" do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do 
    baked_goods = BakedGood.order(:price).reverse
    baked_goods.to_json
  end

  get "/baked_goods/most_expensive" do 
    baked_good = BakedGood.order(:price).reverse.first
    baked_good.to_json
  end

end
