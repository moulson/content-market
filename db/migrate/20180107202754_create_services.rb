class CreateServices < ActiveRecord::Migration[5.1]
  def change
    drop_table :services
    create_table :services do |t|
      t.string :name
      t.attachment :icon
      t.text :short_desc
      t.text :content
      t.attachment :banner

      t.timestamps
    end
  end
end
