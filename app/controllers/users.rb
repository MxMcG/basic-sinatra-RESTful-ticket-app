
get '/users/signup' do
  erb :"/users/signup"
end

post '/users' do
  @user = User.create(params[:new_user])
  session[:user_id] = @user.id
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :new
  end
end

# login routes

post '/users/login' do
  @user = User.find_by(email: params[:email])
  if @user == nil || @user.password != params[:password]
    redirect '/users/login'
  else
    auth_login(@user)
    redirect "/users/#{@user.id}"
  end
end

get '/users/login' do
  erb :"/users/login"
end

# user home page

get '/users/:id' do
  @user = User.find(params[:id])
  if session[:user_id] && session[:user_id].to_s == params[:id]
       erb :home
  else
       redirect '/users/login'
  end
end

get '/users/:id/view' do # add view profile logic
  erb :view_profile
end

# logout route

get '/sessions/logout' do
  session.destroy
  redirect '/'
end