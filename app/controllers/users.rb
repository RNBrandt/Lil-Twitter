post "/users" do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])

  if @user.save
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    "User already exists."
  end

end

get "/users/:id" do
  if logged_in?
  @user = User.find(session[:id])
  current_user == @user
    erb :"/users/show"
  else
    @errors = "Please login to your account to see your site"
    erb :"/sessions/login"
  end

end

get "/users/:id/edit" do
  @user_being_viewed = User.find(params[:id])
  if current_user == @user_being_viewed
    erb :"/users/edit"
  else
    @errors = @user.errors.full_messages
    erb :"/users/_not_logged_in_not_current_user_error_message"
  end
end

put "/users/:id" do
  @user = User.find(params[:id])
  @user.update(first_name: params[:first_name], last_name: params[:last_name],email: params[:email])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
  end
end

delete "/users/:id" do
  @user_being_viewed = User.find(params[:id])
  if current_user == @user_being_viewed
    @user.destroy
    logout!
    redirect '/'
  else
    @errors = @user.errors.full_messages
    "You're not authorized to delete this account"
    erb :"/users/_not_logged_in_not_current_user_error_message"
  end
end
