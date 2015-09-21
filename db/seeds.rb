

20.times do
  user = User.create!(username: "Mxmcg",
                      email: "mmcgee@gmail.com",
                      password: "chickens",
                      created_at: Time.now - rand(20000))
end

20.times do
  user = Ticket.create!(artist: "Soja",
                        date: "3/4/2015",
                        location: "Carlsbad Theatre",
                        time: "8:00 pm",
                        price: "$20.00")
end

20.times do
  user = Post.create!(title: "Seeling Justin Martin tix",
                      body: "I am selling three tickets to the show this weekend",
                      created_at: Time.now - rand(20000))
end

20.times do
  user = Comment.create!(body: "I want that ticket!",
                        created_at: Time.now - rand(20000))
end

