class CreateCompetences < ActiveRecord::Migration[7.0]
  def change
    create_table :competences do |t|
      t.string :code
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
