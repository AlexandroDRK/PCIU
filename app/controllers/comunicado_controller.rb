class ComunicadoController < ApplicationController
  def index
    @comunicado = Comunicado.all
  end
  
  def new
    @comunicado = Comunicado.new
  end

  def create
    @comunicado = Object.new(params[:comunicado])
    if @comunicado.save
      flash[:success] = "Comunicado criado com sucesso."
      redirect_to @comunicado
    else
      flash[:error] = "Algo deu errado."
      render 'new'
    end
  end

  def comunicado_params
    params.require(:comunicado).permit(:'título', :"corpo")
  end
  
  
end
