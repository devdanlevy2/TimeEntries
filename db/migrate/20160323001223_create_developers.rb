class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :email
      t.string :password
      t.string :name

      t.timestamps null: false
    end
  end
end
