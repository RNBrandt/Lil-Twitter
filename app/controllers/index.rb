#This should go to a login page
get '/' do
  if logged_in?
    @user = User.find(session[:id])
  else
    redirect '/sessions/login'
  end
  erb :index
end
