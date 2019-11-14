class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.text :name
      t.text :body
      t.belongs_to :department_app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
