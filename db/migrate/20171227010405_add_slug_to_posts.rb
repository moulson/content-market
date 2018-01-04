class AddSlugToPosts < ActiveRecord::Migration[5.1]
  def change
  	change_table :posts do |t|
  		t.string :slug, unique: true
  	end
  end
end
