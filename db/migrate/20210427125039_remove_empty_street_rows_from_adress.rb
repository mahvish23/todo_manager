class RemoveEmptyStreetRowsFromAdress < ActiveRecord::Migration[6.1]
  def change
    User.where(first_name: nil).destroy_all
  end
end
