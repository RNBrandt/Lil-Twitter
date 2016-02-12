#This should go to a login page
get '/' do
  if logged_in?
    @user = User.find(session[:id])
    erb :'categories/index'
  else
    redirect '/sessions/login'
  end
end
