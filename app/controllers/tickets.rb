get '/users/:id/tickets/new' do
  get_user
  while session[:user_id].to_s == params[:id]
    if request.xhr?
      return erb :"/tickets/_new_ticket_form", layout: false
    else
      erb :'/tickets/_new_ticket_form'
    end
  end
end

post '/users/:id/tickets/new' do
  if request.xhr?
    get_user
    @user.tickets.create(params[:new_ticket])
    return params[:new_ticket].to_json
  end
end

# next, add ticket feed page