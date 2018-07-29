class EncountersController < ApplicationController
    def index 
        encounters = Encounter.where("patient_id = ?", params[:patient_id])
        render json: {status: 'SUCCESS', message: 'Loaded all encounters', data: encounters}, status: :ok
    end 

    def show
        @encounter = Patient.find params[:id]
        render json: {status: 'SUCCESS', data: @encounter}, status: :ok
    end

    def create
        @encounter = Encounter.new(encounter_params)
        if @encounter.save
            render json: {status: 'SUCCESS', message: 'Encounter created sucessfully'}, status: :ok
        else
            render json: {status: 'FAILED', message: 'Encounter not saved'}, status: :error
        end
    end

    def update
        if @encounter.update(encounter_params)
           render json: {status: 'SUCCESS', message: 'Encounter Updated Successfully'}
        else
            render json: {status: 'FAILED', message: 'Encounter Update Failed'}
        end
    end

    def destroy
        @encounter.destroy
    end

    private
    def set_encounter
        @encounter = Encounter.find(params[:id])  
    end
    def encounter_params
        params.require(:encounter).permit(:patient_id, :visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
    end

end
