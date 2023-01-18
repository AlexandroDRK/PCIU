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
    @comunicado = Comunicado.find(params[:comunicado_id])
    @comentario = @comunicado.comentarios.create(comentario_params)
    @comentario.horario = Time.now

    if @comentario.save
      flash[:success] = "Comentário enviado com sucesso."
      redirect_to comunicado_path(@comunicado)
    else
      # render @comunicado
      flash[:error] = "Algo deu errado."
      render 'new'
    end
  end

  private

  def comentario_params
    params.require(:comentario).permit(:corpo, :horario, :comunicado_id)
  end

end
