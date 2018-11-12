require 'rails_helper'



RSpec.describe Product, type: :model do

    # subject {
    # described_class.new(title: "Anything", description: "Lorem ipsum",
    #                   start_date: DateTime.now, end_date: DateTime.now + 1.week)
  #}
  describe 'Validations' do
    # validation tests/examples here
    it "is not valid without a name"
    it "is not valid without a price"
    it "is not valid without a quantity"
    it "is not valid without a category"


  end
end