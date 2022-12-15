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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "Comentário", primary_key: ["idComentário", "comunicado"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idComentário", null: false, auto_increment: true
    t.string "corpo", limit: 1000, null: false
    t.datetime "horário", precision: nil, null: false
    t.integer "comunicado", null: false
    t.index ["comunicado"], name: "fk_Comentário_Comunicado1_idx"
  end

  create_table "Comentário_Usuário", primary_key: ["comentário", "comunicado", "matrícula"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "comentário", null: false
    t.integer "comunicado", null: false
    t.integer "matrícula", null: false
    t.index ["comentário", "comunicado"], name: "fk_Comentário_has_Usuário_Comentário1_idx"
    t.index ["matrícula"], name: "fk_Comentário_has_Usuário_Usuário1_idx"
  end

  create_table "Comunicado", primary_key: ["idComunicado", "turma", "curso", "autor"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idComunicado", null: false, auto_increment: true
    t.string "título", limit: 150, null: false
    t.string "corpo", limit: 3000, null: false
    t.datetime "horário", precision: nil, null: false
    t.integer "turma", null: false
    t.integer "curso", null: false
    t.integer "autor", null: false
    t.index ["autor"], name: "fk_Comunicado_Usuário1_idx"
    t.index ["turma", "curso"], name: "fk_Comunicado_Turma1_idx"
  end

  create_table "Curso", primary_key: "idCurso", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "nome", limit: 90, null: false
    t.string "descrição", limit: 150
  end

  create_table "Turma", primary_key: ["idTurma", "curso"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "idTurma", null: false
    t.string "nome", limit: 45, null: false
    t.integer "curso", null: false
    t.string "período", limit: 45
    t.index ["curso"], name: "fk_Turma_Curso_idx"
  end

  create_table "Turma_Usuário", primary_key: ["turma", "curso", "matrícula"], charset: "utf8mb3", force: :cascade do |t|
    t.integer "turma", null: false
    t.integer "curso", null: false
    t.integer "matrícula", null: false
    t.index ["matrícula"], name: "fk_Turma_has_Usuário_Usuário1_idx"
    t.index ["turma", "curso"], name: "fk_Turma_has_Usuário_Turma1_idx"
  end

  create_table "Usuário", primary_key: "matrícula", id: :integer, default: nil, charset: "utf8mb3", force: :cascade do |t|
    t.string "email", null: false
    t.string "senha", limit: 32, null: false
    t.string "nome", limit: 100, null: false
    t.column "tipo", "enum('Aluno','Professor')", default: "Aluno", null: false
    t.index ["email"], name: "email_UNIQUE", unique: true
    t.index ["matrícula"], name: "matrícula_UNIQUE", unique: true
  end

  add_foreign_key "Comentário", "Comunicado", column: "comunicado", primary_key: "idComunicado", name: "fk_Comentário_Comunicado1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comentário_Usuário", "Comentário", column: "comentário", primary_key: "idComentário", name: "fk_Comentário_has_Usuário_Comentário1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comentário_Usuário", "Comentário", column: "comunicado", primary_key: "comunicado", name: "fk_Comentário_has_Usuário_Comentário1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comentário_Usuário", "Usuário", column: "matrícula", primary_key: "matrícula", name: "fk_Comentário_has_Usuário_Usuário1", on_update: :cascade
  add_foreign_key "Comunicado", "Turma", column: "curso", primary_key: "curso", name: "fk_Comunicado_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comunicado", "Turma", column: "turma", primary_key: "idTurma", name: "fk_Comunicado_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comunicado", "Usuário", column: "autor", primary_key: "matrícula", name: "fk_Comunicado_Usuário1", on_update: :cascade
  add_foreign_key "Turma", "Curso", column: "curso", primary_key: "idCurso", name: "fk_Turma_Curso", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Turma_Usuário", "Turma", column: "curso", primary_key: "curso", name: "fk_Turma_has_Usuário_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Turma_Usuário", "Turma", column: "turma", primary_key: "idTurma", name: "fk_Turma_has_Usuário_Turma1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Turma_Usuário", "Usuário", column: "matrícula", primary_key: "matrícula", name: "fk_Turma_has_Usuário_Usuário1", on_update: :cascade, on_delete: :cascade
end
