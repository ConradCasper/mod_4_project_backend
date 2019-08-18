class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :official_name
      t.string :slogan, default: "Git Rich or Die Pryin'"
      t.string :start_date
      t.string :end_date
      t.string :location
      t.string :image, default: "https://media.glassdoor.com/sqll/964142/flatiron-school-squarelogo-1479222088421.png"
      t.timestamps
    end
  end
end
