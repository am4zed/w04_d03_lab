require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')

get '/pizza-orders' do #index
  @orders = PizzaOrder.all
  erb ( :index )
end

get '/pizza-orders/new' do #new
  erb ( :new )
end

get '/pizza-orders/:id' do #show
  @order = PizzaOrder.find(params[:id])
  erb ( :show )
end

post '/pizza-orders' do #create
  @order = PizzaOrder.new(params)
  @order.save
  erb ( :create )
end

post '/pizza-orders/:id/delete' do #destroyy
  order = PizzaOrder.find(params[:id])
  order.delete
  redirect '/pizza-orders'
end
