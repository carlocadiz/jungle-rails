require 'rails_helper'



RSpec.describe Product, type: :model do

   @category = Category.create(name: "Car")
    subject {
             described_class.new(name: 'Hot Rod', price_cents: 1000,
                      quantity: 1, category_id: 2)
             }

  describe 'Validations' do

    it 'should save as a valid product' do
       expect(subject).to be_valid
    end

    # validation tests/examples here
    it 'should not save without valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save without valid price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      #expect(subject.errors.full_messages).to include("Price can't be blank")

    end

    it 'should not save without valid quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")

    end

    it 'should not save without valid category id' do
      subject.category_id = nil
      expect(subject).to_not be_valid
      #expect(subject.errors.full_messages).to include("Category_id can't be blank")

    end




  end
end