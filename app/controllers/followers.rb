get '/users/:user_id/followers' do
#This will render a list of all the folks the user is following
  @user = User.find(params[:user_id])
  erb :'/user_lists/followers'
end


#get '/users/:user_id/followers/new' do
  #We are not able to control who follows us. this will not be used.
# end

get '/users/:user_id/followers/:follower_id' do
  # This will redirect us to this followers page
  redirect "/user/#{params[:follower_id]}"
end

# The remainder of these will not be used because the user will have limited editorial control over their audience

# stretch goal, to add a delete and block button






# GET /photos photos#index  display a list of all photos
# GET /photos/new photos#new  return an HTML form for creating a new photo
# POST  /photos photos#create create a new photo
# GET /photos/:id photos#show display a specific photo
# GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
# PATCH/PUT /photos/:id photos#update update a specific photo
# DELETE  /photos/:id photos#destroy  delete a specific photo
