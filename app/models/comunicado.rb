class Comunicado < ApplicationRecord
  self.table_name = "Comunicado"
  belongs_to :turma, class_name: "Turma"
  #belongs_to :curso, class_name: "Curso"
  belongs_to :autor, class_name: "Usuario"
end
