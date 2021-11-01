
ActiveRecord::Schema.define(version: 2021_10_29_183104) do

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.date "fecha_de_nacimiento"
    t.integer "dni"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
