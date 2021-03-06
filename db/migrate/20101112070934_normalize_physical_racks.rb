class NormalizePhysicalRacks < ActiveRecord::Migration
  def self.up
    rename_table :rack, :physical_racks
    rename_column :physical_racks, :nom_rack, :nom
    rename_column :machines, :rack_id, :physical_rack_id
  end

  def self.down
    rename_column :physical_racks, :nom, :nom_rack
    rename_table :physical_racks, :rack
    rename_column :machines, :physical_rack_id, :rack_id
  end
end
