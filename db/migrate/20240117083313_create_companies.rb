class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :establish_year
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
