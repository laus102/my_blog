class UserSignUpSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :auth_token
end
