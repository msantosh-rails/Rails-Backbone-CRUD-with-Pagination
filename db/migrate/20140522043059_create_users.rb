class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
