class AddEventToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :event, index: true, foreign_key: true
  end
end
