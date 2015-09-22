get '/' do
  # Look in app/views/index.erb
  @tickets = Ticket.all
  erb :index
end
