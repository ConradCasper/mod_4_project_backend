class Cohort < ApplicationRecord
    has_many :user_cohorts, :dependent => :destroy
    has_many :users, through: :user_cohorts, :dependent => :destroy
end
