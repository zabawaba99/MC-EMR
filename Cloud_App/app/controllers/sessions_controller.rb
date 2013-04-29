
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".

class SessionsController < ApplicationController

    def new
        if signed_in?
            redirect_to home_path\
        end
    end
    
    def create
        user = User.find_by_userName(params[:session][:userName].downcase)
            if user && user.authenticate(params[:session][:password])
               sign_in user
               redirect_to home_path
            else
               flash.now[:error] = 'Invalid email/password combination'
              render 'new'
      end
    end

    def destroy
        sign_out
        redirect_to root_url
    end


end
