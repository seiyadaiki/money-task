class CreateUsedMoneys < ActiveRecord::Migration[6.0]
  def change
    create_table :used_moneys do |t|
      t.date       :when,     null:false
      t.string     :where 
      t.string     :what,     null:false
      t.integer    :way_id,   null:false 
      t.integer    :how_much, null:false
      t.references  :user,    null:false, foreign_key: true
      t.timestamps 
    end
  end
end
