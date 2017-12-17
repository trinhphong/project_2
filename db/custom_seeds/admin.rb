puts "Create Admin"
User.create(email: "nguyenquoctin921996@gmail.com",password: "123456", admin: "true")
User.create(email: "camquang27@gmail.com",password: "123456", admin: "true")
puts "Create Admin success!!!"