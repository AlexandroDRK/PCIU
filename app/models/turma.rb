class Turma < ApplicationRecord
  self.table_name = "Turma"
  self.primary_key = :idTurma
  belongs_to :curso
end
