class IncidencesController < ApplicationController
  before_action :set_incidence, only: [:show, :edit, :update, :destroy]
  # GET /incidences
  # GET /incidences.json
  def index
    @incidences = current_user.clients.last.incidences
  end

  # GET /incidences/1
  # GET /incidences/1.json
  def show
  end

  # GET /incidences/new
  def new
    @incidence = Incidence.new
    @area = params[:area_id]
    @servicios = Service.where(area_id: @area, prioridad: "3")
    @equipo = Equipment.where(area_id: @area)
  end

  # GET /incidences/1/edit
  def edit
    @area = params[:area_id]
    @servicios = Service.where(area_id: @area)

  end

  # POST /incidences
  # POST /incidences.json
  def create
    @incidence = Incidence.new(incidence_params)
    @hola = @incidence
    if current_user.rol = "2"
    @incidence.client_id = current_user.clients.last.id
    @incidence.estado = "Espera"
    @hola = perfil_path
    end
    respond_to do |format|
      if @incidence.save
        format.html { redirect_to @hola, notice: 'Incidence was successfully created.' }
        format.json { render :show, status: :created, location: @incidence }
      else
        format.html { render :new }
        format.json { render json: @incidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidences/1
  # PATCH/PUT /incidences/1.json
  def update
    respond_to do |format|
      if @incidence.update(incidence_params)
        format.html { redirect_to @incidence, notice: 'Incidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @incidence }
      else
        format.html { render :edit }
        format.json { render json: @incidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidences/1
  # DELETE /incidences/1.json
  def destroy
    @incidence.destroy
    respond_to do |format|
      format.html { redirect_to incidences_url, notice: 'Incidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidence
      @incidence = Incidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidence_params
      params.require(:incidence).permit(:tipo, :prioridad, :estado, :comentario, :service_id, :area_id, :client_id, :technical_id, :equipment_id)
    end
end
