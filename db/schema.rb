# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101030210300) do

  create_table "applications", :force => true do |t|
    t.string  "nom",                     :default => "", :null => false
    t.integer "criticite", :limit => 1,  :default => 0,  :null => false
    t.text    "info",                                    :null => false
    t.string  "iaw",       :limit => 55, :default => "", :null => false
    t.string  "pe",        :limit => 55, :default => "", :null => false
    t.string  "moa",                     :default => "", :null => false
    t.string  "amoa",                    :default => "", :null => false
    t.string  "moa_note",                :default => "", :null => false
    t.string  "contact",                 :default => "", :null => false
    t.string  "pnd",                     :default => "", :null => false
    t.string  "ams",       :limit => 55, :default => "", :null => false
    t.integer "cerbere",   :limit => 1,  :default => 0,  :null => false
    t.string  "fiche",                   :default => "", :null => false
  end

  create_table "applications_machines", :id => false, :force => true do |t|
    t.integer "machine_id",     :default => 0, :null => false
    t.integer "application_id", :default => 0, :null => false
  end

  create_table "bureaux", :force => true do |t|
    t.string "bureau_court", :default => "", :null => false
    t.string "bureau_long",  :default => "", :null => false
  end

  create_table "cddvd", :force => true do |t|
    t.string "cd_dvd", :limit => 50, :default => "", :null => false
  end

  create_table "frequence", :force => true do |t|
    t.decimal "frequence", :precision => 50, :scale => 0, :default => 0, :null => false
  end

  create_table "interfaces", :force => true do |t|
    t.integer "id_machines",                 :default => 0,     :null => false
    t.integer "id_sousreseaux",              :default => 0,     :null => false
    t.string  "quatr_octet",    :limit => 9, :default => "",    :null => false
    t.boolean "virtuelle",                   :default => false, :null => false
  end

  create_table "iscsi", :force => true do |t|
    t.string "iscsi", :limit => 50, :default => "", :null => false
  end

  create_table "machines", :force => true do |t|
    t.integer "theme_id",                         :default => 6,   :null => false
    t.integer "service_id",                       :default => 1,   :null => false
    t.integer "os_id",                            :default => 12,  :null => false
    t.integer "site_id",                          :default => 3,   :null => false
    t.integer "rack_id",                          :default => 5,   :null => false
    t.integer "cddvd_id",                         :default => 5,   :null => false
    t.integer "mainteneur_id",                    :default => 1,   :null => false
    t.string  "nom",               :limit => 150, :default => "",  :null => false
    t.string  "ancien_nom",                       :default => "",  :null => false
    t.string  "sousreseau_ip",     :limit => 23,  :default => "",  :null => false
    t.string  "quatr_octet",       :limit => 9,   :default => "",  :null => false
    t.string  "numero_serie",      :limit => 100, :default => "",  :null => false
    t.integer "memoire_virtuelle", :limit => 1,   :default => 0,   :null => false
    t.text    "description",                                       :null => false
    t.string  "modele",            :limit => 100, :default => "",  :null => false
    t.string  "memoire",           :limit => 50,  :default => "",  :null => false
    t.float   "frequence",                        :default => 0.0, :null => false
    t.string  "date_mes",          :limit => 100, :default => "",  :null => false
    t.string  "fin_garantie",      :limit => 100, :default => "",  :null => false
    t.string  "type_contrat",      :limit => 100, :default => "",  :null => false
    t.string  "type_hd",           :limit => 50,  :default => "",  :null => false
    t.integer "taille_disque",                    :default => 0,   :null => false
    t.string  "marque",            :limit => 50,  :default => "",  :null => false
    t.string  "ref_proc",          :limit => 100, :default => "",  :null => false
    t.string  "type_serveur",      :limit => 50,  :default => "",  :null => false
    t.integer "nb_proc",                          :default => 0,   :null => false
    t.integer "nb_coeur",                         :default => 0,   :null => false
    t.integer "nb_rj45",                          :default => 0,   :null => false
    t.integer "nb_fc",                            :default => 0,   :null => false
    t.integer "nb_iscsi",                         :default => 0,   :null => false
    t.string  "type_disque_alt",   :limit => 50,  :default => "",  :null => false
    t.integer "taille_disque_alt",                :default => 0,   :null => false
    t.integer "nb_disque",                        :default => 0,   :null => false
    t.integer "nb_disque_alt",                    :default => 0,   :null => false
  end

  create_table "machines_sousreseaux", :force => true do |t|
    t.integer "id_machines",    :default => 0, :null => false
    t.integer "id_sousreseaux", :default => 0, :null => false
  end

  create_table "mainteneur", :force => true do |t|
    t.string "mainteneur",   :limit => 50,  :default => "", :null => false
    t.string "tel",          :limit => 100, :default => "", :null => false
    t.string "mail",         :limit => 200, :default => "", :null => false
    t.string "adresse_post", :limit => 200, :default => "", :null => false
    t.string "ref_client",   :limit => 50,  :default => "", :null => false
  end

  create_table "marque", :force => true do |t|
    t.string "marque", :limit => 100, :default => "", :null => false
  end

  create_table "os", :force => true do |t|
    t.string "os_titre",   :limit => 55, :default => "", :null => false
    t.string "os_img_url",               :default => "", :null => false
  end

  create_table "rack", :force => true do |t|
    t.string "nom_rack", :limit => 50, :default => "", :null => false
  end

  create_table "ref_proc", :force => true do |t|
    t.string "ref_proc", :limit => 50, :default => "--", :null => false
  end

  create_table "services", :force => true do |t|
    t.string "service_titre", :default => "", :null => false
  end

  create_table "site", :force => true do |t|
    t.string "nom_site", :limit => 50, :default => "", :null => false
  end

  create_table "sousreseaux", :force => true do |t|
    t.string "sousreseau_ip",             :limit => 23, :default => "", :null => false
    t.string "sousreseau_nom_logique",                  :default => "", :null => false
    t.string "sousreseau_couleur_fond",   :limit => 7,  :default => "", :null => false
    t.string "sousreseau_couleur_police", :limit => 7,  :default => "", :null => false
  end

  add_index "sousreseaux", ["sousreseau_ip"], :name => "sousreseau_ip"

  create_table "themes", :force => true do |t|
    t.string "theme_titre", :default => "", :null => false
  end

  create_table "type", :force => true do |t|
    t.string "type_serveur", :limit => 100, :default => "", :null => false
  end

end
