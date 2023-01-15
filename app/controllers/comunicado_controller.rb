class ComunicadoController < ApplicationController
  #before_action :authenticate_usuario!, only: [:destroy]
  def index
    @usuario = Usuario.find_by(matricula: current_usuario)
    
    if @usuario.tipo == "Professor"
      @comunicados = Comunicado.where(autor_id: @usuario.matricula)
    else
      @comunicados = Comunicado.all
    end

  end
  
  def new
    @comunicado = Comunicado.new
  end

  def create
    @usuario = Usuario.find_by(matricula: current_usuario)
    if @usuario.tipo == "Professor" 
      @usuario = Usuario.find_by(matricula: current_usuario)
      @comunicado = Comunicado.new(comunicado_params)
      @comunicado.autor_id = @usuario.matricula
      @comunicado.horario = Time.now

      if @comunicado.save
        flash[:success] = "Comunicado criado com sucesso."
        redirect_to root_url
      else
        # render @comunicado
        flash[:error] = "Algo deu errado."
        render 'new'
      end
    end
  end

  def destroy
    @comunicado = Comunicado.find(params[:id])
    @comunicado.destroy
    flash[:notice] = "Comunicado excluido com sucesso."
    redirect_to root_url
  end

  private

  def comunicado_params
    params.require(:comunicado).permit(:titulo, :corpo, :horario, :turma_id, :autor_id)
  end
  
  
end