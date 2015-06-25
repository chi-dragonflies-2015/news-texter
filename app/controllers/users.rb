post '/users' do
  @user = User.new({email: params[:email], password: params[:password]})
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :"users/login"
  end
end

get '/users/new' do
  erb :"/users/new"
end

get '/users/:id' do
  p '**************'
  p params[:id]
  @user = User.find_by_id(params[:id])
  erb :"/users/show"
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/edit"
end

put '/users/:id' do
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :"/users/edit"
  end
end


