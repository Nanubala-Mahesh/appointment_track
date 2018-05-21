class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :check_for_valid_authtoken
  skip_before_action :verify_authenticity_token

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = []
    Appointment.all.each do |appointment|
      # binding.pry
      appointment_hash = {}
      appointment_hash["id"] = appointment.id
      appointment_hash["patient"] = Patient.find_by_id(appointment.patient_id).try(:name) 
      # binding.pry
      appointment_hash["doctor"] = Doctor.find_by_id(appointment.doctor_id).try(:name)
      appointment_hash["diseases"] = appointment.diseases
      @appointments << appointment_hash
    end
    # binding.pry
    render json: Response.new.success('All Appointments', @appointments, @current_user.acess_token)    
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: Response.new.success('appointment created succesfully', appointment, @current_user.acess_token)
    else
      render json: Response.new.failure(appointment.errors.full_messages.join(', '), nil)
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      # binding.pry
      params.require(:appointment).permit(:patient_id, :doctor_id, :diseases)
    end
end
