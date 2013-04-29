
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".

class MedicationsController < ApplicationController
before_filter :signed_in_user


 def show
      @medication = Medication.find(params[:id]) 
  end

def new
    @medication = Medication.new    
end

def create
     @medication = Medication.new(params[:medication])
    if @medication.save
      flash[:success] = "You have successfuly Created a medication"  
      redirect_to @medication
    else
      render 'new'
    end
  end

  def index
    @medications = Medication.order(:name)
    respond_to do |format|
    format.html
    format.csv { send_data @medications.to_csv}
    format.xls
  end
end

end
  private 

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
