class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /equipment
  # GET /equipment.json
  def index
    if current_user.rol == "1"
      @equipment = @current_user.clients.last.equipments
    else
      @equipment = Equipment.all
    end
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
    @area = Area.all
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.entrada = Time.current
    if @current_user.rol == "1"
      @equipment.client_id = @current_user.clients.last.id
    end
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to :back, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to incide_path, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:marca, :tipo, :garantia, :entrada, :client_id, :area_id, :codigo, :cambio)
    end
end
