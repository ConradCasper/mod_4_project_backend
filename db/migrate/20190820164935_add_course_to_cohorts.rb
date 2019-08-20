class AddCourseToCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :cohorts, :course, :string
  end
end
