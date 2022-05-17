class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end
  def show
    @suppliers = Supplier.find(params[:id])
  end
  
  def new
    @suppliers = Supplier.new()
  end
  
  def edit
    @suppliers = Supplier.find(params[:id])
  end
  
  def update
    p = params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, 
      :full_address, :city, :state, :email)
      @suppliers = Supplier.find(params[:id])
      
      if @suppliers.update(p)
        redirect_to suppliers_path(@suppliers.id), notice: 'cadastro do fornecedor atualizado com sucesso'
      else
        flash[:notice] = 'Não foi possivel atualizar o cadastro do fornecedor'
        render 'edit'
      end
  end
    
    def create 
      p = params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, 
        :full_address, :city, :state, :email)
        @suppliers = Supplier.new(p)
        if @suppliers.save()
          flash[:notice] = "Fornecedor cadastrado com sucesso."
          redirect_to suppliers_path
        else
          flash.now[:notice] = 'Fornecedor não cadastrado'
          render 'new'
        end
    end
      private
      
      def set_supplier
        @supplier = Supplier.find(params[:id])
      end
      
end
