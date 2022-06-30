class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :tech_1
      t.string :tech_2
      t.string :tech_3

      t.timestamps
    end
  end
end
