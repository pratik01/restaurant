class RenameIsLikeToIsLikeInLike < ActiveRecord::Migration
  def change
    rename_column :likes, :isLike, :is_like
  end
end
