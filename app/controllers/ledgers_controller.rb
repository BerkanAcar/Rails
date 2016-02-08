class LedgersController < ApplicationController
  if @current_user
    before_action :authenticate_user!
  end
  before_action :set_ledger, only:[:show, :edit, :update, :destroy]
  def index
    @ledgers = Ledger.where(user_id: current_user.id).all
  end
  
  def new
		@ledger = Ledger.new
  end

  def create
  	@ledger = Ledger.new(ledger_params)
  	@ledger.user_id = current_user.id
    if	@ledger.save
  		redirect_to @ledger
  	else
  		render 'new'
  	end
  end

  def show
    if @ledger.user_id == current_user.id
      return @ledger
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @ledger.update(ledger_params)
      redirect_to @ledger
    else
      render 'edit'
    end
  end

  def destroy
    @ledger.destroy
    redirect_to ledgers_path
  end

  private
  def set_ledger
    @ledger = Ledger.find(params[:id])
  end

  def ledger_params
  	params.require(:ledger).permit(:income, :expense, :user_id)
  end
end
