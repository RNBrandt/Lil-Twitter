# tweets controller
get '/tweets' do
  # This will take set a User variable, and erb to
end

get '/tweets/new' do
  if logged_in?
    @user = User.find(session[:id])
    erb :'tweets/new'
  else
    redirect '/sessions/login'
  end
end

get '/tweets/:id' do
    @tweet = Tweet.find(session[:id])
    erb :'tweets/view'
end

post '/users/:user_id/tweets' do
  @tweet = Tweet.new (params[:tweet])
  @tweet.user_id =(params[:user_id])
  if @tweet.save
    redirect "/"
  else
    @errors = @tweet.errors.full_messages
    @user = User.find(session[:id])
    erb :'tweets/new'
  end
end


















# GET /photos photos#index  display a list of all photos
# GET /photos/new photos#new  return an HTML form for creating a new photo
# POST  /photos photos#create create a new photo
# GET /photos/:id photos#show display a specific photo
# GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
# PATCH/PUT /photos/:id photos#update update a specific photo
# DELETE  /photos/:id photos#destroy  delete a specific photo
