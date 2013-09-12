class NumbersayerController < ApplicationController
  def show
    # pass
  end

  def calculate
    number = params[:calculate][:number]
    locale = params[:calculate][:locale].to_sym

    if number !~ /\A\d+\Z/
      respond_to do |format|
        errmsg = "#{number} is not a number"
        format.html { redirect_to root_path, alert: errmsg }
        format.json { render json: { error: errmsg }, status: :unprocessable_entity }
      end
      return
    end


    @reply = number.to_i.to_english(locale == :uk)

    respond_to do |format|
      format.html { render :action => :index }
      format.json do 
        render :json => { reply: @reply }
      end
    end
  end
end
