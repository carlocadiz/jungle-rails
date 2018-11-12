require 'rails_helper'

RSpec.describe User, type: :model do

    # subject {
    #          described_class.new(email: 'carlocadiz@gmail.com', first_name: 'Carlo'
    #                   last_name: 'Cadiz')
    #          }

  describe 'Validations' do

    # it 'should save as a valid product' do
    #    expect(subject).to be_valid
    # end

   it 'should save as valid user' do
      @user = User.new(email: 'carlocadiz@gmail.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: 'test123', password_confirmation: 'test123')
      expect(@user).to be_valid
   end

   it 'should have matching password and password_confirmation' do
      @user = User.new(email: 'carlocadiz@gmail.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: 'test123', password_confirmation: 'test124')
      expect(@user).to_not be_valid
   end

   it 'should not save without a valid email' do
      @user = User.new(email: nil, first_name: 'Carlo', last_name: 'Cadiz',
                        password: 'test123', password_confirmation: 'test123')
      expect(@user).to_not be_valid
   end

   it 'should not save without a valid first name' do
      @user = User.new(email: 'carlocadiz@gmail.com', first_name: nil, last_name: 'Cadiz',
                        password: 'test123', password_confirmation: 'test123')
      expect(@user).to_not be_valid
   end

   it 'should not save without a valid last name' do
      @user = User.new(email: 'carlocadiz@gmail.com', first_name: 'Carlo', last_name: nil,
                        password: 'test123', password_confirmation: 'test123')
      expect(@user).to_not be_valid
   end

   it 'should not save when email is not unique' do
       @user = User.new(email: 'carlocadiz@gmail.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: 'test123', password_confirmation: 'test123')
       @user2 = User.new(email: 'CARLOCADIZ@GMAIL.COM', first_name: 'Carlo', last_name: 'Cadiz',
                        password: 'test123', password_confirmation: 'test123')
       @user.save!
       expect(@user2).to_not be_valid
   end

   it 'should not save with a password length of less than 6 characters' do
      @user = User.new(email: 'carlocadiz@gmail.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: 'test', password_confirmation: 'test')
      expect(@user).to_not be_valid
   end










    # validation tests/examples here
    # it 'should not save without valid email' do
    #   subject.email = nil
    #   expect(subject).to_not be_valid
    #  # expect(subject.errors.full_messages).to include("Name can't be blank")
    # end

    # it 'should not save without first name' do
    #   subject.first_name = nil
    #   expect(subject).to_not be_valid
    #   #expect(subject.errors.full_messages).to include("Price can't be blank")

    # end

    # it 'should not save without last name' do
    #   subject.last_name = nil
    #   expect(subject).to_not be_valid
    #  expect(subject.errors.full_messages).to include("Quantity can't be blank")

    # end




  end
end