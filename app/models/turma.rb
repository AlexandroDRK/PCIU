class Turma < ApplicationRecord
  self.table_name = "Turma"
  belongs_to :curso
  has_and_belongs_to_many :comunicado, join_table: :Turma_Comunicado
  has_and_belongs_to_many :usuario, join_table: :Turma_Usuario
end
