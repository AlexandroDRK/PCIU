class ComentarioController < ApplicationController
  def index
    @comentarios = Comentario.all
  end

  def new
    @comunicado = Comunicado.find_by(id: params[:comunicado_id])
    if @comunicado.present?
      @comentario = @comunicado.comentarios.new(comentario_params)
    else
      flash[:error] = "Comunicado não encontrado"
      redirect_to comunicado_path
    end
  end

  def show
    @comunicado = Comunicado.find_by(id: params[:comunicado_id])
    redirect_to comunicado_path(@comunicado)
  end

  def create
    @usuario = Usuario.find_by(matricula: current_usuario)
    @comentario = Comentario.new(comentario_params)
    @comentario.horario = Time.now
    @comentario.usuario_id = @usuario.id

    if @comentario.save
      flash[:success] = "Comentário enviado com sucesso."
      redirect_to comunicado_path(id: @comentario.comunicado_id)
    else
      # render @comunicado
      flash[:error] = "Algo deu errado."
      render 'new'
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    flash[:notice] = "Comentário excluido com sucesso."
    redirect_to comunicado_path(@comentario.comunicado_id)
  end

  private

  def comentario_params
    params.require(:comentario).permit(:corpo, :horario, :comunicado_id)
  end

end
