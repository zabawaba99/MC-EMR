
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".

class PatientsController < ApplicationController
  before_filter :signed_in_user

  def show
      @patient = Patient.find(params[:id]) 
      @visits = Patient.find(params[:id]).visits
  end


  def new
      @patient = Patient.new
  end

  def create
      @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:success] = "You have successfuly Created a patient"
      redirect_to @patient
    else
      render 'new'
    end
  end

    def index
        @patients = Patient.all
    end
        
    end

    def edit
    # @patient = patient.find(params[:id])
    end

    def update
    # if @patient.update_attributes(params[:patient])
    #   flash[:success] = "Profile updated"
    #   redirect_to @patient
    # else
    #   render 'edit'
    # end
    end

    private 

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  