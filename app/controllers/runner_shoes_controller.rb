class RunnerShoesController < ApplicationController

    before_action :set_runner_shoe, only: [:show]

    def show
    end

    def new
        @runner_shoe = RunnerShoe.new
    end

    def create
        @runner_shoe = RunnerShoe.new(runner_shoe_params)
        if @runner_shoe.save
            redirect_to runner_shoe_path(@runner_shoe)
        else
            render :new
        end
    end

    private

    def runner_shoe_params
        params.require(:runner_shoe).permit(:shoe_id, :runner_id)
    end

    def set_runner_shoe
        @runner_shoe = RunnerShoe.find(params[:id])
    end
end