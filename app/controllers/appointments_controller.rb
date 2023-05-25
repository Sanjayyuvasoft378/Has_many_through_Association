class AppointmentsController < ApplicationController
  before_action :current_appointments, only: [:show, :edit, :destroy, :update]

  def index
    @appointments = Appointment.all
  end

  def show; end

  def new
    @appointment = Appointment.new
  end

  def create 
    @appointment = Appointment.new(app_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new, status: :unprocessabele_entity
    end
  end

  def edit; end

  def update
    if @appointment.update(app_params)
      redirect_to @appointment
    else
      render :edit, status: :unprocessabele_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, status: :see_other
  end

  def app_params
    params.require(:appointment).permit(:patient_id, :physician_id, :appointment_data)
  end

  def current_appointments
    @appointment = Appointment.find(params[:id])
  end
end
