class HomeController < ApplicationController
  def land
  end

  def dash
    @localities = Locality.all
  end
end
