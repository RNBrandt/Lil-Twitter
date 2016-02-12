get '/session-viewer' do
  # for troubleshooting
  session.inspect
end

get "/sessions/login" do
  if logged_in?
    @user = User.find(session[:id])
    redirect "/users/#{@user.id}"
  else
    erb :"/sessions/login"
  end
end

get "/sessions/register" do
  if logged_in?
    @user = User.find(session[:id])
    redirect "/users/#{@user.id}"
  else
    erb :"/sessions/register"
  end
end

post '/sessions' do
  puts params[:email]
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = "Username and/or Password INCORRECT"
    erb :"/sessions/login"
  end
end

delete '/sessions' do
  session.delete(:id)
  redirect '/'
end

