class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :college
      t.string :school
      t.integer :mobile
      t.string :test_score
      t.timestamps
    end
  end
end
