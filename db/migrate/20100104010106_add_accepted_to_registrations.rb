class AddAcceptedToRegistrations < ActiveRecord::Migration
  def self.up
    change_table :registrations do |t|
      t.boolean :accepted, :default => true
    end
  end

  def self.down
    change_table :registrations do |t|
      t.remove :accepted
    end
  end
end
