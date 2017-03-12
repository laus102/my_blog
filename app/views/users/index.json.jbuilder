# users/index

json.users @users do |user|
  json.id user.id
  json.email user.email
  # json.password user.password
end