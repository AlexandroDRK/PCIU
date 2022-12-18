class CursoController < ApplicationController
  def index
    @cursos  = Curso.all()
  end

  def show
  end
end
