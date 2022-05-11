require 'rails_helper'

RSpec.describe Warehouse, type: :model do
describe '#valid' do
    it 'false when name is empty' do
      # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço',
                                  cep: '25000-000', city: 'Rio', area: 10000, description: 'Alguma coisa')

      # Act
        result = warehouse.valid?

      # Expect
        expect(result).to eq false
      end

    it 'false when code is empty' do
        # Arrange
          warehouse = Warehouse.new(name: 'Rio', code: '', address: 'Endereço',
                                    cep: '25000-000', city: 'Rio', area: 10000, description: 'Alguma coisa')

        # Act
        result = warehouse.valid?

        # Expect
        expect(result).to eq false

      end
    it 'false when adress is empty' do

          # Arrange
            warehouse = Warehouse.new(name: 'Rio', code: '', address: '',
                                      cep: '25000-000', city: 'Rio', area: 10000, description: 'Alguma coisa')

          # Act
          result = warehouse.valid?

          # Expect
        expect(result).to eq false

        end

    it 'false when code is already in use' do
          # Arrange
          first_warehouse = Warehouse.create(name: 'RIO', code: 'RIO', address: 'Endereço',
                                              cep: '25000-000', city: 'Rio', area: 10000, description: 'Alguma coisa')

          second_warehouse = Warehouse.create(name: 'belford roxo', code: 'RIO', address: 'Endereço longe ',
                                              cep: '25000-400', city: 'Rio de janeiro ', area: 30000, description: 'outra coisa')
          # Act
          result = second_warehouse.valid?
          
          # Assert
          expect(result).to eq false
          
       end

       it 'false when cep is wrong' do
        # Arrange
        first_warehouse = Warehouse.new(name: 'RIO', code: 'RIO', address: 'Endereço',
                                        cep: '002-000', city: 'Rio', area: 10000, description: 'Alguma coisa')

        # Act
        result = first_warehouse.valid?
        
        # Assert
        expect(result).to eq false
        
     end
  end
end
