post '/users' do
  @user = User.authenticate(params[:email], params[:password])
    if @user
    session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      erb :"users/login"
    end
end
get '/users/new' do
  erb :"/users/new"
end

get 'users/:id' do
  @user = User.find(params[:id])
  erb :"/users/show"
end

get 'users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/edit"
end

put 'users/:id/edit' do
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :"/users/edit"
  end
end


