class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews

    validates :email, uniqueness: {case_sensitive: false} 
    validates :first_name, presence: true 
    validates :last_name, presence: true 
    validates :password , length: {minimum: 3}

   def self.authenticate_with_credentials(params)
    email = params[:email].downcase.gsub(" ", "").strip.squish
    if user = User.find_by_email(email)
        user.authenticate(params[:password])
    else
        nil  
    end
   end 
    
end

