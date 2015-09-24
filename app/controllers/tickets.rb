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
    p "&" * 80
    p params[:new_ticket]
    @ticket = @user.tickets.create(params[:new_ticket])
    p @ticket.id
      return erb :'tickets/_new_ticket', layout: false
  end
end

get '/tickets/:id' do
  @ticket = Ticket.find_by(id: params[:id])
  erb :'/tickets/view_ticket'
end

delete '/users/:user_id/tickets/:id/delete' do
  @ticket = Ticket.find_by(id: params[:id])
  @user = User.find_by(id: params[:user_id])
  if request.xhr?
    @ticket.destroy
  end
end

# next, add ticket feed page