class WarehousesController < ApplicationController
  before_action :set_warehouse, only:[:show, :edit, :update, :destroy]
  def show
  end
  
  def new
    @warehouse = Warehouse.new()
  end
  
  def destroy
    @warehouse.destroy
    redirect_to root_path, notice: 'Galpão removido com sucesso'
  end
  
  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save()
      flash[:notice] = "Galpão cadastrado com sucesso."
      redirect_to root_path
    else
      flash.now[:notice] = 'Galpão não cadastrado'
      render 'new'
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @warehouse.update(warehouse_params)
      redirect_to warehouse_path(@warehouse.id), notice: 'Galpão atualizado com sucesso'
    else
      flash.now[:notice] = 'Não foi possivel atualizar o galpão'
      render 'edit'
    end
  end
  
  
  private
  
  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
  
  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :area, 
      :cep, :description, :address )
  end
    
end
