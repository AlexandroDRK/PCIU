class ComentarioController < ApplicationController
  def index
    @comentarios = Comentario.all
  end

  def new
    @comunicado = Comunicado.find(params[:comunicado_id])
    if @comunicado.present?
      @comentario = @comunicado.comentarios.build(comentario_params)
    else
      flash[:error] = "Comunicado não encontrado"
      redirect_to comunicado_path
    end
  end

  def create
    @usuario = Usuario.find_by(matricula: current_usuario)
    @comunicado = Comunicado.find(params[:comunicado_id])
    @comentario = @comunicado.comentarios.build(comentario_params)
    @comentario.horario = Time.now
    @comentario.usuario_id = @usuario.id
  
    if @comentario.save
      redirect_to @comunicado
    else
      render 'comunicado/show'
    end
  end
  
  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    flash[:notice] = "Comentário excluído com sucesso."
    redirect_to comunicado_path(@comentario.comunicado_id)
  end

  private

  def comentario_params
    params.require(:comentario).permit(:corpo, :horario, :comunicado_id)
  end
end
