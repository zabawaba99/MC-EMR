
  # Copyright ©  Mobile Clinic-Electronic Medical Records.
  #   Permission is granted to copy, distribute and/or modify this document
  #   under the terms of the GNU Free Documentation License, Version 1.3
  #   or any later version published by the Free Software Foundation;
  #   with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
  #   A copy of the license is included in the section entitled "GNU
  #   Free Documentation License".

class AppusersController < ApplicationController

  before_filter :signed_in_user
  before_filter :correct_user,   only: [:new, :create ,:edit, :update]
  
  def index
      @appuser = Appuser.all
  end
  
  def show
    @appuser = Appuser.find(params[:id])
  end

  def new
    @appuser = Appuser.new
  end

  def create
      @appuser = Appuser.new(params[:appuser])
    if @appuser.save
      flash[:success] = "You have successfuly created a user"
      redirect_to @appuser
    else
      render 'new'
    end
  end

  def edit
    @appuser = Appuser.find(params[:id])
  end

  def update
    @appuser = Appuser.find(params[:id])

    if @appuser.update_attributes(params[:appuser])
      flash[:success] = "Profile updated"
      redirect_to @appuser
    else
      render 'edit'
    end
  end

  private 

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      redirect_to(root_path) unless admin_user?
    end


end
