class AddQueueToRegistrations < ActiveRecord::Migration
  def self.up
    change_table :registrations do |t|
      t.boolean :queue, :default => false
    end
  end

  def self.down
    change_table :registrations do |t|
      t.remove :queue
    end
  end
end
