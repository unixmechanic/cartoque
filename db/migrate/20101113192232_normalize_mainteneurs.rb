class NormalizeMainteneurs < ActiveRecord::Migration
  def self.up
    rename_table :mainteneur, :mainteneurs
    rename_column :mainteneurs, :mainteneur, :nom
    rename_column :mainteneurs, :tel, :telephone
    rename_column :mainteneurs, :adresse_post, :adresse
  end

  def self.down
    rename_column :mainteneurs, :nom, :mainteneur
    rename_column :mainteneurs, :telephone, :tel
    rename_column :mainteneurs, :adresse, :adresse_post
    rename_table :mainteneurs, :mainteneur
  end
end
