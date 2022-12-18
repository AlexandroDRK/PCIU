class Turma < ApplicationRecord
  self.table_name = "Turma"
  belongs_to :curso
end
