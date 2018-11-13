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
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    # @user = User.create(email: 'carlocadiz@yahoo.com', first_name: 'Carlo', last_name: 'Cadiz',
    #                     password: '123456', password_confirmation: '123456')
    #@user.save!

    it 'should not successfully login' do
     # debugger
      @user = User.create(email: 'carlocadiz@yahoo.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: '123456', password_confirmation: '123456')
      expect(User.authenticate_with_credentials('carlo@gmail.com', @user.password)).to eq nil
    end

    it 'should successfully login' do
     # debugger
      @user = User.create(email: 'carlocadiz@yahoo.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: '123456', password_confirmation: '123456')
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq @user
    end

    it 'should successfully login' do
     # debugger
      @user = User.create(email: 'carlocadiz@yahoo.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: '123456', password_confirmation: '123456')
      expect(User.authenticate_with_credentials('   carlocadiz@yahoo.com   ', @user.password)).to eq @user
    end

    it 'should successfully login' do
     # debugger
      @user = User.create(email: 'carlocadiz@yahoo.com', first_name: 'Carlo', last_name: 'Cadiz',
                        password: '123456', password_confirmation: '123456')
      expect(User.authenticate_with_credentials('   caRLOcadiz@YAHOO.COM ', @user.password)).to eq @user
    end


  end
end