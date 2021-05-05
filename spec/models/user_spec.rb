require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.new(
      first_name: 'Amanda',
      last_name: 'Tuyen',
      email: 'amanda@email.com',
      password: 'amanda',
      password_confirmation: 'amanda'
    )
  end

  describe 'Validations' do

    it 'is valid with all fields present and password matches password confirmation' do
      expect(@user).to be_valid
      expect(@user.password).to eql(@user.password_confirmation)
    end

    it 'is invalid if email is not present' do
      @user.email = nil
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it 'is invalid if first name is not present' do
      @user.first_name = nil
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
    end

    it 'is invalid if last name is not present' do
      @user.last_name = nil
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
    end

    it 'is invalid if password is not present' do
      @user.password = nil
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it 'is invalid if password confirmation is not present' do
      @user.password_confirmation = nil
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank")
    end

    it 'is invalid if password does not match password confirmation' do
      @user.password_confirmation = 'candy'
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it 'password length must be greater than 5 characters' do
      @user.password = 'farm'
      @user.password_confirmation = 'farm'
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 5 characters)")
    end

    it 'is invalid if email is not unique/in database already' do
      new_user = User.new(
        first_name: 'Amanda',
        last_name: 'Tuyen',
        email: 'AMANDA@email.com',
        password: 'amanda',
        password_confirmation: 'amanda'
      )
      new_user.save
      @user.email = 'AMANDA@email.com'
      @user.save

      expect(@user).to be_invalid
      expect(@user.errors.full_messages[0]).to eq("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'returns and instance of the user if authentication is successful' do
      @user.save
      
      expect(User.authenticate_with_credentials("amanda@email.com", "amanda")).to eq(@user)
    end

    it 'returns nil if authentication is unsuccessful due to incorrect password' do
      @user.save

      expect(User.authenticate_with_credentials("amanda@email.com", "wrong")).to eq(nil)
    end

    it 'still authenticates user if they have spaces before or after email address' do
      @user.save

      expect(User.authenticate_with_credentials("  amanda@email.com  ", "amanda")).to eq(@user)
    end

    it 'username is not case-sensitive, will still authenticate' do
      @user.save

      expect(User.authenticate_with_credentials("AMANDA@email.com", "amanda")).to eq(@user)
    end

  end



end
