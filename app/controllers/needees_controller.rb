class NeedeesController < ApplicationController
  def new
    @needee = Needee.new
    @localities = Locality.all
  end
end
