class Comunicado < ApplicationRecord
  self.primary_key = :idComunicado, :turma_id, :curso_id, :autor_id
  self.table_name = "Comunicado"
  belongs_to :turma, class_name: "Turma"
  belongs_to :curso, class_name: "Curso"
  belongs_to :autor, class_name: "Usuario"
end
