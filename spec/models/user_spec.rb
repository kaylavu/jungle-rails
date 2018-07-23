require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it "is valid with valid attributes" do
      @user = User.create ({
      first_name: "Jennifer", 
      last_name: "Lawrence", 
      email: "jenniferlaw@gmail.com", 
      password: "1234", 
      password_confirmation: "1234"
      })
      expect(@user.id).to be_present
    end

    it "is not valid without matching password" do
      @user = User.create ({
      first_name: "Jennifer", 
      last_name: "Lawrence", 
      email: "jenniferl@gmail.com", 
      password: "123", 
      password_confirmation: "12345"
      })
      expect(@user.id).to_not be_present
    end

    it "is not valid without email" do
      @user = User.create ({
      first_name: "Jennifer", 
      last_name: "Lawrence", 
      email: nil, 
      password: "123", 
      password_confirmation: "12345"
      })
      expect(@user.id).to_not be_present
    end

    it "is not valid without first name" do
      @user = User.create ({
      first_name: nil, 
      last_name: "Lawrence", 
      email: "nil", 
      password: "123", 
      password_confirmation: "12345"
      })
      expect(@user.id).to_not be_present
    end

    it "is not valid without last name" do
      @user = User.create ({
      first_name: "Jennifer", 
      last_name: nil, 
      email: "nil", 
      password: "123", 
      password_confirmation: "12345"
      })
      expect(@user.id).to_not be_present
    end

    it "is not valid with duplicate emails" do
      @user1 = User.create ({
      first_name: "Jennifer", 
      last_name: "Lawrence", 
      email: "jennifer@gmail.com", 
      password: "123", 
      password_confirmation: "123"
      })

      @user2 = User.create ({
        first_name: "Jennifer", 
        last_name: "Aniston", 
        email: "JENNifer@gmail.com", 
        password: "12345", 
        password_confirmation: "12345"
        })
      expect(@user2.id).to_not be_present
    end

    it "is not valid when password length is less than 2 characters" do
      @user = User.create ({
      first_name: "Jennifer", 
      last_name: "Smith", 
      email: "jsmith@gmail.com", 
      password: "12", 
      password_confirmation: "12"
      })
      expect(@user.id).to_not be_present
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should return user with appropriate credentials" do 
    @user = User.create ({
      first_name: "Jennifer", 
      last_name: "Lawrence", 
      email: "jenniferl@gmail.com", 
      password: "123", 
      password_confirmation: "123"
      })
     
      user = User.authenticate_with_credentials(:email=> @user.email,:password => @user.password)
      expect(user).to be_present
    end 

    it "should not return a user when password is incorrect" do 
      @user = User.create ({
        first_name: "Jennifer", 
        last_name: "Lawrence", 
        email: "jenniferl@gmail.com", 
        password: "123", 
        password_confirmation: "123"
        })
       
        user = User.authenticate_with_credentials(:email=> @user.email,:password => "wrong password")
        expect(user).to_not be_present
      end 

      it "should not return a user when email is incorrect" do 
        @user = User.create ({
          first_name: "Jennifer", 
          last_name: "Lawrence", 
          email: "jenniferl@gmail.com", 
          password: "123", 
          password_confirmation: "123"
          })
         
          user = User.authenticate_with_credentials(:email=> "some fake email@gmail.com",:password => @user.password)
          expect(user).to_not be_present
        end 

  end

end
