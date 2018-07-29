class PatientsController < ApplicationController
    def index 
        patients = Patient.all
        render json: {status: 'SUCCESS', message: 'Loaded all patients', data: patients}, status: :ok
    end 

    def show
        @patient = Patient.find params[:id]
        render json: {status: 'SUCCESS', data: @patient}, status: :ok
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            render json: {status: 'SUCCESS', message: 'Patient created sucessfully'}, status: :ok
        else
            render json: {status: 'FAILED', message: 'Patient not saved'}, status: :error
        end
    end

    def update
        if @patient.update(patient_params)
            render json: {status: 'SUCCESS', message: 'Patient Updated Sucessfully'}, status: :ok
        else
            render json: {status: 'FAILED', message: 'Patient Update Failed'}, status: :error
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
