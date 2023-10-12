class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, 'LOWER(email)', unique: true
  end
end
