class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :bio, default: "Flatiron School Alum."
      t.string :avatar, default: "https://pbs.twimg.com/profile_images/1149340751265980417/s0j8V4p3.png"
      t.string :location
      t.string :project_1
      t.string :project_2
      t.string :github
      t.string :twitter
      t.string :facebook
      t.string :linkedIn
      t.string :email
      t.string :current_employer

      t.timestamps
    end
  end
end
