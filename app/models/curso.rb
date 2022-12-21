class Curso < ApplicationRecord
    self.table_name = "Curso"
    self.primary_key = :idCurso
    has_many :turmas
end
