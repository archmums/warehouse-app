class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end
  def new
  end
  def create
  warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, 
                                    :cep, :description, :address )
  w = Warehouse.new(warehouse_params)
  w.save()
  redirect_to root_path
  end
end