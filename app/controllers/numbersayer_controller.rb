class NumbersayerController < ApplicationController
  def show
    # pass
  end

  def calculate
    number = params[:calculate][:number].to_s
    locale = params[:calculate][:locale].to_s.to_sym
    errmsg = ""


    if number.blank?
      errmsg = "You didn't specified any number!"
    elsif number !~ /\A\d+\Z/
      errmsg = "'#{number}' is not a number!"
    end

    unless errmsg.blank?
      respond_to do |format|
        format.html { redirect_to root_path, alert: errmsg }
        format.json { render json: { error: errmsg }, status: :unprocessable_entity }
      end
      return
    end


    @reply = number.to_i.to_english(locale == :uk)

    respond_to do |format|
      format.html { render :action => :show }
      format.json do 
        render :json => { reply: @reply }
      end
    end
  end
end
