class AddAgeGroupIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :age_group, foreign_key: true
  end
end
