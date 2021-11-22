class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :subject
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
