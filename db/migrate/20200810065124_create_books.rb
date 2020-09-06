class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.string :title  #追加
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
