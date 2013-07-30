class PagesController < ApplicationController

  def home
    @token = params[:token]
  end

end
