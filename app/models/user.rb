class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    has_many :user_cohorts, :dependent => :destroy
    has_many :cohorts, through: :user_cohorts, :dependent => :destroy
end
