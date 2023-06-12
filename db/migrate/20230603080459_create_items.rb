class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,        null: false
      t.text       :explane,          null:false
      t.integer    :category_id,      null:false
      t.integer    :item_state_id,    null:false
      t.integer    :charge_id,        null:false
      t.integer    :area_id,          null:false
      t.integer    :deliver_day_id,   null:false
      t.integer    :price,            null:false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
