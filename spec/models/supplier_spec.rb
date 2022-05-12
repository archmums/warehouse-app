require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid' do

    it 'false when name is empty' do
      # Arrange
      supplier = Supplier.new(corporate_name: '', brand_name: 'Apple', registration_number: '1322195511111', 
                                full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')
      # Act
      result = supplier.valid?
      # Expect
      expect(result).to eq false

    end


    it 'false when brand name is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'Apple INC', brand_name: '', registration_number: '1322195511111', 
                                full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')
        # Act
        result = supplier.valid?
        # Expect
        expect(result).to eq false

    end

    it 'false when address is empty' do
        # Arrange
        supplier = Supplier.new(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '1322195511111', 
                                  full_address: '', city: 'manaus', state: 'Amazonas', email: 'keybepcasp@gmail.com')
        # Act
        result = supplier.valid?
        # Expect
        expect(result).to eq false
    end
    

    it 'false when CNPJ is already in use' do
        # Arrange
        first_supplier = Supplier.create(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '1322195511111', 
                                            full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')

        second_supplier = Supplier.create(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '1322195511111', 
                                            full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')
        # Act
        result = second_supplier.valid?
          
        # Assert
        expect(result).to eq false
          
       end


    it 'false when CNPJ is wrong' do
        # Arrange
        first_supplier = Supplier.new(corporate_name: 'Apple INC', brand_name: 'Apple', registration_number: '14322195511111', 
                                      full_address: 'louren Street, number ', city: 'manaus', state: 'Amazonas', email: 'keybpcasp@gmail.com')

        # Act
        result = first_supplier.valid?
        
        # Assert
        expect(result).to eq false
        
     end
  end 
end
