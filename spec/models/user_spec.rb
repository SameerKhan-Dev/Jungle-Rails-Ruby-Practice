require 'rails_helper'

RSpec.describe User, type: :model do
  

  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # validation tests/examples here
    it 'saves successfully when a password and password_confirmation field is provided' do
      user = User.new(first_name: "Mike1", last_name:"Joe", email:"mike1@hotmail.com",password: "hello", password_confirmation: "hello")
      user.save!
      expect(user.id).to be_present
    end

    it 'fails saving when password and password_confirmation do not match' do
      user = User.create(first_name: "Mike2", last_name:"Joe", email:"mike2@hotmail.com", password: "hello", password_confirmation: "cool")
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'fails saving when either password or password_confirmation fields are missing' do
      user = User.create(first_name: "Mike3", last_name:"Joe", email:"mike3@hotmail.com", password_confirmation: "cool")
      expect(user.errors.full_messages).to include("Password can't be blank")
      user2 = User.create(password: "hello")
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'fails saving / throws error when first_name, last_name or email is not set' do
      user = User.create(last_name:"Joe", email:"Jack1@hotmail.com", password:"cool", password_confirmation: "cool")
      expect(user.errors.full_messages).to include("First name can't be blank")
      user2 = User.create(first_name: "Jack2", email:"Jack2@hotmail.com", password:"cool", password_confirmation: "cool")
      expect(user2.errors.full_messages).to include("Last name can't be blank")
      user3 = User.create(first_name: "Jack3", last_name:"Joe", password:"cool", password_confirmation: "cool")
      expect(user3.errors.full_messages).to include("Email can't be blank")
    end

    it 'fails saving when given email already exists in database' do
      user = User.create(first_name: "Tim",last_name:"Joe", email:"Jack1@hotmail.com", password:"cool", password_confirmation: "cool")
      user2 = User.new(first_name: "Tim", last_name:"Joe", email:"Jack1@hotmail.com", password:"cool", password_confirmation: "cool")
      expect(user.id).to_not be_nil
      expect(user2.id).to be_nil

    end

  end
end


=begin
    create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end
=end