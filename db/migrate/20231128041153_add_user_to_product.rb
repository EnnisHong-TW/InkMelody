class AddUserToProduct < ActiveRecord::Migration[7.1]
  def change
    # add_column :products, :user_id, :integer
    # add_reference :products, :user
    add_belongs_to :products, :user
  end
end
