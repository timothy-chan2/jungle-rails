require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save if all registration page validations pass' do
      @user = User.new(first_name: 'Chris', last_name: 'Bates', email: 'bates@email.ca', password: '1234', password_confirmation: '1234')
      @user.save!

      expect(@user.id).to be_present
    end
    
    it 'should not save if password and password confirmation do not match' do
      @user = User.new(first_name: 'Chris', last_name: 'Bates', email: 'bates@email.ca', password: '1234', password_confirmation: '98765')
      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end

    it 'should not save if password is not entered' do
      @user = User.new(first_name: 'Chris', last_name: 'Bates', email: 'bates@email.ca')
      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include('Password can\'t be blank')
    end

    it 'should not save if email already exists in the database' do
      @user = User.new(first_name: 'Chris', last_name: 'Bates', email: 'bates@email.ca', password: '1234', password_confirmation: '1234')
      @user.save

      @user2 = User.new(first_name: 'Sandra', last_name: 'Yu', email: 'BATES@EMAIL.ca', password: 'pass', password_confirmation: 'pass')
      @user2.save

      expect(@user2.id).not_to be_present
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'should not save if email is not entered' do
      @user = User.new(first_name: 'Chris', last_name: 'Bates', password: '1234', password_confirmation: '1234')
      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include('Email can\'t be blank')
    end

    it 'should not save if first name is not entered' do
      @user = User.new(last_name: 'Bates', email: 'bates@email.ca', password: '1234', password_confirmation: '1234')
      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include('First name can\'t be blank')
    end

    it 'should not save if last name is not entered' do
      @user = User.new(first_name: 'Chris', email: 'bates@email.ca', password: '1234', password_confirmation: '1234')
      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include('Last name can\'t be blank')
    end
  end

  describe 'Password Length' do
    it 'should save if password length is 4 characters or longer' do
      @user = User.new(first_name: 'Cassie', last_name: 'Han', email: 'han@email.ca', password: 'oehkfieg34', password_confirmation: 'oehkfieg34')
      @user.save!

      expect(@user.id).to be_present
    end
    
    it 'should not save if password length is less than 4 characters' do
      @user = User.new(first_name: 'Cassie', last_name: 'Han', email: 'han@email.ca', password: 'oe4', password_confirmation: 'oe4')
      @user.save

      expect(@user.id).not_to be_present
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
    end
  end
end
