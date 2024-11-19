class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :title
      t.string :media
      t.string :media_type

      t.timestamps
    end
  end
end
