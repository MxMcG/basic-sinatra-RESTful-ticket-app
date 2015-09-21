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
    @ticket = @user.tickets.create(params[:new_ticket])
    p '8' * 100
    p @ticket.id
      return erb :'tickets/_new_ticket', layout: false
  end
end

get '/tickets/:id' do
  @ticket = Ticket.find_by(id: params[:id])
  erb :'/tickets/ticket'
end


# next, add ticket feed page