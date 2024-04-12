class SignupMailer < ApplicationMailer
    default  from: "prathikshark2002@gmail.com" 

    def welcome(user)
        @user=user
        mail to: @user.email, subject: "welcoming you"
    end
end
