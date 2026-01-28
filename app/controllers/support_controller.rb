class SupportController < ApplicationController
  def show
    @page = SupportPage.find_by!(slug: params[:slug])
  end
end