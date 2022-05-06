class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end
  def new
    @warehouse = Warehouse.new()
  end
  def create
  warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, 
                                    :cep, :description, :address )
  @warehouse = Warehouse.new(warehouse_params)
  if @warehouse.save()
    flash[:notice] = "Galpão cadastrado com sucesso."
    redirect_to root_path
  else
    flash.now[:notice] = 'Galpão não cadastrado'
    render 'new'
  end

  end
end