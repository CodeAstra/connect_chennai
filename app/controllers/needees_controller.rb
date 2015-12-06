class NeedeesController < ApplicationController
  def index
    if current_user.profile_incomplete?
      redirect_to edit_user_path(current_user)
      return
    end
    if params[:help_type]
      @help_type = params[:help_type].to_i
      @locality_id = params[:locality_id].to_i
    else
      @help_type = current_user.type_of_help
      @locality_id = current_user.locality_id
    end

    if @help_type == Needee::HelpType::VOLUNTEER[:code]
      @needees = Needee.where(locality_id: @locality_id).order(id: :desc)
    else
      @needees = Needee.where(type_of_help: @help_type, locality_id: @locality_id).order(id: :desc)
    end
    @volunteers = User.where(type_of_help: Needee::HelpType::VOLUNTEER[:code], locality_id: @locality_id).order(id: :desc)
    @localities = Locality.all
  end

  def new
    @needee = Needee.new
    @localities = Locality.all
  end

  def create
    @needee = Needee.new(needee_params)
    if verify_recaptcha(model: @needee) && @needee.save
      flash[:notice] = "A volunteer will contact you soon"
      redirect_to root_path
    else
      @localities = Locality.all
      flash[:alert] = "Please enter all details"
      render :new
    end
  end

private
  def needee_params
    params.require(:needee).permit(:name, :phone, :locality_id, :type_of_help, :address, :details)
  end
end
