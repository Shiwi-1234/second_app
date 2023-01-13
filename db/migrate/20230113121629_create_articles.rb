class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.string :day

      t.timestamps
    end
  end
end
