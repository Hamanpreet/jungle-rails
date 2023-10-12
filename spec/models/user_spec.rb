require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with matching password and password_confirmation' do
      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'should not be created with non-matching password and password_confirmation' do
      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'different_password'
      )
      expect(user).to_not be_valid
    end

    it 'should require a password' do
      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: 'test@example.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should require a password_confirmation' do
      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: nil
      )
      expect(user).to_not be_valid
    end

    it 'should have a unique email (case-insensitive)' do
      User.create(
        first_name:'ABC',
        last_name:'DEF',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )

      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: 'TEST@EXAMPLE.COM',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should require an email' do
      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should require a first name' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: nil,
        last_name:'DEF'
      )
      expect(user).to_not be_valid
    end

    it 'should require a last name' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        last_name: nil,
        first_name:'ABC'
      )
      expect(user).to_not be_valid
    end

    it 'should require a minimum password length of 8 characters' do
      user = User.new(
        first_name:'ABC',
        last_name:'DEF',
        email: 'test@example.com',
        password: 'pass', # Less than 8 characters
        password_confirmation: 'pass'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end
end
