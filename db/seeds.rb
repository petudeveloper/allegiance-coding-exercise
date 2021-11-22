User.destroy_all

User.create!([
  { 
    email: 'adminUser@email.com',
    name: 'adminUser', admin: true,
    password: SecureRandom.uuid 
  },
  { 
    email: 'user1@email.com',
    name: 'user1', admin: false,
    password: SecureRandom.uuid 
  }
])

p "adminUser and user1 created"

User.last.requests.create([
  { subjec: "subject request", body: "Body of the request" }
])

p "One request created"
