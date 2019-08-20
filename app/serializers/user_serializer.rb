class UserSerializer < ActiveModel::Serializer
  attributes :username, :bio, :avatar, :location, :project_1, :project_2, :github, :twitter, :facebook, :linkedIn, :email, :name, :current_employer
end
