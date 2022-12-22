class Curso < ApplicationRecord
    self.table_name = "Curso"
    has_many :turmas
end
