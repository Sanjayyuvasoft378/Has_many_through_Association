class PatientsController < ApplicationController
  before_action :current_patient, only: [:show, :edit, :destroy, :update]
  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @patient.destroy
    redirect_to patients_path, status: :see_other
  end

  def patient_params
    params.require(:patient).permit(:name)
  end
  
  def current_patient
    @patient = Patient.find(params[:id])
  end
end
