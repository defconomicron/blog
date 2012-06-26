class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :email
      t.string :password
      t.string :name

      t.timestamps
    end
  end
end
