class AddPrivateToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :private, :boolean
    add_reference :wikis, :user, index: true
  end
end
