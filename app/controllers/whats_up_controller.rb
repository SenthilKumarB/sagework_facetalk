class WhatsUpController < ApplicationController
  def index
    @whats_up = WhatsUp.new
    @current_user_whats_up = WhatsUp.find(:all, :order => "created_at DESC")

    render :layout => "main"
   
  end

  def create
    if current_user.whats_up << WhatsUp.new(params[:whats_up])
      redirect_to :back
    end
  end

  def whats_up_comment
    whats_up = WhatsUp.find(params[:id])
    whats_up.whats_up_comment << WhatsUpComment.new(params[:whats_up_comment])
                             redirect_to :back
      
  end
end

