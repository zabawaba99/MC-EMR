
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".

class StaticPagesController < ApplicationController
before_filter :signed_in_user

  def home
  	@patients = Patient.order(:updated_at)
  	@newVisits = Visit.where("created_at = updated_at")
  	@returnVisits = Visit.where("created_at != updated_at")
  	@visits = Visit.order(:created_at)
  end

  def createuser
  end


    def get_visit_count
    	visits.count
    	
    end

  private 

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
