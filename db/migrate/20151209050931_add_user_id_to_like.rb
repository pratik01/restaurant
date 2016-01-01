class AddUserIdToLike < ActiveRecord::Migration
  def change
    add_belongs_to :likes ,:user
  end
end
