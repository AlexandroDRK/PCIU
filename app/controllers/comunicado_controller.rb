class ComunicadoController < ApplicationController
  def index
    @comunicado = Comunicado.all
  end
  
  def new
    @comunicado = Comunicado.new
  end

  def create
    @usuario = Usuario.find_by(matricula: current_usuario)
    @comunicado = Comunicado.new(comunicado_params)
    @comunicado.autor_id = @usuario.matricula
    @comunicado.horario = Time.now

    #@turma = Turma.find_by(id: @comunicado.turma_id)
    #@comunicado.curso_id = Curso.find_by(id: @turma.curso_id)

    if @comunicado.save
      flash[:success] = "Comunicado criado com sucesso."
      redirect_to root_url
    else
      render @comunicado.errors
      flash[:error] = "Algo deu errado."
      render 'new'
    end
  end

  private

  def comunicado_params
    params.require(:comunicado).permit(:titulo, :corpo, :horario, :turma_id, :autor_id)
  end
  
  
end
