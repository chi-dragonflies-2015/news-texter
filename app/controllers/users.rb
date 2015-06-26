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
  @user = User.find_by_id(params[:id])
  @articles = CachedArticle.last(3)
  erb :"/users/show"
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  if request.xhr?
    erb :"/users/edit", layout: false
  else
  erb :"/users/edit"
  end
end

put '/users/:id' do
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    if request.xhr?
      email = @user.email
      phone = @user.phone
      JSON.generate(email: email, phone: phone)
    else
      redirect "/users/#{@user.id}"
    end
  else
    erb :"/users/edit"
  end
end


