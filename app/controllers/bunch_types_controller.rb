class BunchTypesController < ApplicationController
  before_action :set_bunch_type, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    p bunch_type_params
    respond_to do |format|
      if @bunch_type.update(bunch_type_params)
        format.html { redirect_to :back, notice: 'Group form type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit'}
        format.json { render json: @bunch_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bunch_type
      @bunch_type = BunchType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bunch_type_params
      params.require(:bunch_type).permit(:name, fields_attributes: [:id, :field_type, :name, :required])
    end
end
