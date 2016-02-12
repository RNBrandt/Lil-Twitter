get '/users/:user_id/following' do
  # Will show a list of all the users THIS user is following
end

# get '/users/:user_id/following/new' do
# We probably won't need this since all we need is a POST
# end

post '/users/:user_id/following' do
  # we will need to set the @followed variable and set that user id into the appropriate value in the user object.
end

delete '/users/:user_id/following/:followed_id' do
# will delete what a person is following
  end







# GET /photos photos#index  display a list of all photos
# GET /photos/new photos#new  return an HTML form for creating a new photo
# POST  /photos photos#create create a new photo
# GET /photos/:id photos#show display a specific photo
# GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
# PATCH/PUT /photos/:id photos#update update a specific photo
# DELETE  /photos/:id photos#destroy  delete a specific photo
