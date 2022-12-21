# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2022_12_19_075723) do
  create_table "Comentário", primary_key: ["idComentário", "comunicado"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idComentário", null: false, auto_increment: true
=======
ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "Comentario", primary_key: ["idComentario", "comunicado_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idComentario", null: false, auto_increment: true
>>>>>>> f9ab40b (Comunicados branch)
    t.string "corpo", limit: 1000, null: false
    t.datetime "horario", precision: nil, null: false
    t.integer "comunicado_id", null: false
    t.index ["comunicado_id"], name: "fk_Comentário_Comunicado1_idx"
  end

  create_table "Comentario_Usuario", primary_key: ["comentario", "comunicado", "matricula"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "comentario", null: false
    t.integer "comunicado", null: false
    t.integer "matricula", null: false
    t.index ["comentario", "comunicado"], name: "fk_Comentário_has_Usuário_Comentário1_idx"
    t.index ["matricula"], name: "fk_Comentário_has_Usuário_Usuário1_idx"
  end

  create_table "Comunicado", primary_key: ["idComunicado", "autor_id", "curso_id", "turma_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idComunicado", null: false, auto_increment: true
    t.string "titulo", limit: 150, null: false
    t.string "corpo", limit: 3000, null: false
    t.datetime "horario", precision: nil, null: false
    t.integer "turma_id", null: false
    t.integer "curso_id", null: false
    t.integer "autor_id", null: false
    t.index ["autor_id"], name: "fk_Comunicado_Usuário1_idx"
    t.index ["turma_id", "curso_id"], name: "fk_Comunicado_Turma1_idx"
  end

  create_table "Curso", primary_key: "idCurso", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "nome", limit: 90, null: false
    t.string "descricao", limit: 150
  end

  create_table "Turma", primary_key: ["idTurma", "curso_id"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idTurma", null: false
    t.string "nome", limit: 45, null: false
    t.integer "curso_id", null: false
    t.string "periodo", limit: 45
    t.index ["curso_id"], name: "fk_Turma_Curso_idx"
  end

  create_table "Turma_Usuario", primary_key: ["turma", "curso", "matricula"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "turma", null: false
    t.integer "curso", null: false
    t.integer "matricula", null: false
    t.index ["matricula"], name: "fk_Turma_has_Usuário_Usuário1_idx"
    t.index ["turma", "curso"], name: "fk_Turma_has_Usuário_Turma1_idx"
  end

  create_table "Usuario", primary_key: "matricula", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "email", null: false
    t.string "senha", limit: 32, null: false
    t.string "nome", limit: 100, null: false
    t.column "tipo", "enum('Aluno','Professor')", default: "Aluno", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "email_UNIQUE", unique: true
<<<<<<< HEAD
    t.index ["matrícula"], name: "matrícula_UNIQUE", unique: true
    t.index ["reset_password_token"], name: "index_Usuário_on_reset_password_token", unique: true
=======
    t.index ["matricula"], name: "matrícula_UNIQUE", unique: true
>>>>>>> f9ab40b (Comunicados branch)
  end

  add_foreign_key "Comentario", "Comunicado", column: "comunicado_id", primary_key: "idComunicado", name: "fk_Comentário_Comunicado1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comentario_Usuario", "Comentario", column: "comentario", primary_key: "idComentario", name: "fk_Comentário_has_Usuário_Comentário1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comentario_Usuario", "Comentario", column: "comunicado", primary_key: "comunicado_id", name: "fk_Comentário_has_Usuário_Comentário1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comentario_Usuario", "Usuario", column: "matricula", primary_key: "matricula", name: "fk_Comentário_has_Usuário_Usuário1", on_update: :cascade
  add_foreign_key "Comunicado", "Turma", column: "curso_id", primary_key: "curso_id", name: "fk_Comunicado_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comunicado", "Turma", column: "turma_id", primary_key: "idTurma", name: "fk_Comunicado_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comunicado", "Usuario", column: "autor_id", primary_key: "matricula", name: "fk_Comunicado_Usuário1", on_update: :cascade
  add_foreign_key "Turma", "Curso", column: "curso_id", primary_key: "idCurso", name: "fk_Turma_Curso", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Turma_Usuario", "Turma", column: "curso", primary_key: "curso_id", name: "fk_Turma_has_Usuário_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Turma_Usuario", "Turma", column: "turma", primary_key: "idTurma", name: "fk_Turma_has_Usuário_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Turma_Usuario", "Usuario", column: "matricula", primary_key: "matricula", name: "fk_Turma_has_Usuário_Usuário1", on_update: :cascade, on_delete: :cascade
end
