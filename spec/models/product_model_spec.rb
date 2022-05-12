require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do 

    it 'false quando peso e dimensões menor igual a 0' do
      #Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                  full_address: 'Av colorado N200', email: 'Samsung@support.com')
      pm = ProductModel.new(name:'TV 32', weight: 0, width: 0, height:45, depth:10, 
                            sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)
      #Act
      result = pm.valid?
      #Assert
      expect(result).to eq false
      end

    it 'false quando Nome em branco' do
      #Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                  full_address: 'Av colorado N200', email: 'Samsung@support.com')
      pm = ProductModel.new(name:'', weight: 30, width: 40, height:45, depth:10, 
                            sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)
      #Act
      result = pm.valid?
      #Assert
      expect(result).to eq false
      
    end

    it 'false quando Altura igual a 0' do
      #Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                  full_address: 'Av colorado N200', email: 'Samsung@support.com')
      pm = ProductModel.new(name:'TV-32', weight: 30, width: 40, height: 0, depth:10, 
                            sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)
      #Act
      result = pm.valid?
      #Assert
      expect(result).to eq false
      
    end

    it 'false quando Peso igual a 0' do
      #Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                  full_address: 'Av colorado N200', email: 'Samsung@support.com')
      pm = ProductModel.new(name:'TV-32', weight: 0, width: 40, height: 30, depth:10, 
                            sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)
      #Act
      result = pm.valid?
      #Assert
      expect(result).to eq false
      
    end

    it 'false quando Largura igual a 0' do
      #Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                  full_address: 'Av colorado N200', email: 'Samsung@support.com')
      pm = ProductModel.new(name:'TV-32', weight: 40, width: 0, height:30, depth:10, 
                                  sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)
      #Act
      result = pm.valid?
      #Assert
      expect(result).to eq false
    end

    it 'false quando Profundidade igual a 0' do
      #Arrange
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
                                  full_address: 'Av colorado N200', email: 'Samsung@support.com')
      pm = ProductModel.new(name:'TV-32', weight: 40, width: 20, height:30, depth:0, 
                            sku:'TV32SAMSU-XPT44O10s0', supplier: supplier)
      #Act
      result = pm.valid?
      #Assert
      expect(result).to eq false
  end

    it 'false quando SKU invalido' do
    #Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronic LTDA', registration_number: '1234567891234', 
            full_address: 'Av colorado N200', email: 'Samsung@support.com')
    pm = ProductModel.new(name:'TV 32', weight: 39, width: 40, height:45, depth:10, 
                          sku:'TV32', supplier: supplier)
   #Act
   result = pm.valid?
   #Assert
   expect(result).to eq false
   end

  end
end