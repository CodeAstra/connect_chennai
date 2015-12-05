class NeedeesController < ApplicationController
  def index
    if params[:help_type]
      @needees = Needee.where(type_of_help: params[:help_type], locality_id: params[:locality_id])
    else
      @needees = []
    end
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
