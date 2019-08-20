class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates_format_of :email, :with => /@/
    has_many :user_cohorts, :dependent => :destroy
    has_many :cohorts, through: :user_cohorts, :dependent => :destroy
end
