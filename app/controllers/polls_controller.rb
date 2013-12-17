class PollsController < ApplicationController
  before_action :set_bunch, only: [:edit]

  def show
    @polls = Poll.where(bunch_type_id: params[:id])
  end

  def new
    @poll = Poll.new(bunch_type_id: params[:bunch_type_id])
  end

  def edit
  end

  def create
    @poll = Poll.new(poll_params)
    respond_to do |format|
      if @poll.save
        format.html { redirect_to :back, notice: 'Answer was successfully saved. Please go to next form' }
      else
        format.html { render action: 'new' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bunch
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:name, :company_id, :bunch_type_id).tap do |whitelisted|
        whitelisted[:properties] = params[:poll][:properties]
      end
    end
end
