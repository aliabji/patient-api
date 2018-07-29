class PatientsController < ApplicationController
    def index 
        @patients = Patient.all
    end

    def show
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            render :show, status :created, location: @patient
        else
            render json: @patient.errors, status :unprocessable_entity
        end
    end

    def update
        if @patient.update(patient_params)
           render :show, status: :ok, location: @patient
        else
            render json: @patient.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @patient.destroy
    end

    private
    def set_patient
        @patient = Patient.find(params[:id])  
    end
    def patient_params
        params.require(:patient).permit(:first, :middle, :last, :weight, :height, :MRN)
    end
end
