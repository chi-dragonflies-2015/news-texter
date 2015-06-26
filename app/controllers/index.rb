get '/' do
  # grab_articles #DELETE THIS LATER
  erb :index
end

get '/login' do
  erb :login
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
    if @user
    session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      erb :"users/login"
  end
end

get '/logout' do
  session[:user_id] =  nil
  redirect '/'
end

