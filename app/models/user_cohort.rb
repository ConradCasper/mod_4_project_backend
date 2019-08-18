class UserCohort < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  belongs_to :cohort, :dependent => :destroy
end
