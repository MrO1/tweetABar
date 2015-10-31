class WelcomesController < ApplicationController
  def index
  	@welcomes = Welcome.new
  end

  def create
  	@info = Welcome.new(welcome_params)	

  	# redirect_to "/"
  	if @info.valid?
      MessageMailer.message_me(@info).deliver
  	end

  	respond_to do |format|
  		format.html{}
  	end


  end

  def subscribe
    @list_id = "28ce55c1cc"
    gb = Gibbon::API.new

    gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })
  end

  

  private

  def welcome_params
  	params.require(:welcome).permit(:name, :content)
  end

end
