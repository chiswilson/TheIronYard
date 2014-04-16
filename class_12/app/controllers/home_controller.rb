class HomeController < ApplicationController
  # respond_to :html

  def index
    @presidents = President.all
    # respond_with @presidents
  end
  
end
