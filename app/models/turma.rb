class Turma < ApplicationRecord
  self.table_name = "Turma"
  belongs_to :curso
  has_and_belongs_to_many :usuarios, join_table: :Turma_Usuario
end
