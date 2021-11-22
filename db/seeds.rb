User.destroy_all

User.create!([
  { 
    email: 'adminUser@email.com',
    name: 'adminUser', admin: true,
    password: '123456' 
  },
  { 
    email: 'user1@email.com',
    name: 'user1', admin: false,
    password: '123456'  
  }
])

p "adminUser and user1 created"

User.last.requests.create([
  { subject: "subject request", body: "Body of the request" }
])

p "One request created"
