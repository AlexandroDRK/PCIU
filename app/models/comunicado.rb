class Comunicado < ApplicationRecord
  self.table_name = "Comunicado"
  belongs_to :turma
  belongs_to :curso
  belongs_to :autor
end
