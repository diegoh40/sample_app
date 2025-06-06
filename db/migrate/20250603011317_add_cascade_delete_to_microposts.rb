class AddCascadeDeleteToMicroposts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :microposts, :users
    add_foreign_key :microposts, :users, on_delete: :cascade
  end
end
