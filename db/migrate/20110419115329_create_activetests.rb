class CreateActivetests < ActiveRecord::Migration
  def self.up
    create_table :activetests do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :activetests
  end
end
