class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.text :short_desc
      t.text :content
      t.attachment :icon
      t.attachment :banner

      t.timestamps
    end
  end
end
