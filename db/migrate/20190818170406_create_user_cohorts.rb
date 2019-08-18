class CreateUserCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cohorts do |t|
      t.references :user, foreign_key: true
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
