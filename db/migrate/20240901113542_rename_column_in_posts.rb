class RenameColumnInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :post_genres_id, :post_genre_id
  end
end
