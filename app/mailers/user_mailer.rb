class UserMailer < ApplicationMailer

    def purchase_email
        @user = params[:user]
        mail(to: @user.email, subject: 'Your Recent Purchase')
    end
end
