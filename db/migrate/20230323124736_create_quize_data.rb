class CreateQuizeData < ActiveRecord::Migration[7.0]
  def change
    create_table :quize_data do |t|
      t.string :questions
      t.string :right_answer
      t.string :options
      t.timestamps
    end
  end
end
