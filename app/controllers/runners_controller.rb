class RunnersController < ApplicationController
    before_action :set_runner, only: [:show, :edit, :update, :destroy]
    
    def index
        @runners = Runner.all
    end

    def show
    end

    def new
        @runner = Runner.new
    end
    
    def create
        @runner = Runner.new(runner_params)
        @user = @runner.build_user
        @user.username = params[:username]
        if @runner.save && @user.save
            @runner.user.profileable = @runner
            redirect_to runner_path(@runner)
        else
            render :new
        end
    end

    def edit
        @user = @runner.user
    end

    def update
        @user = @runner.user
        @user.username = params[:user][:username]
        if @runner.update(runner_params) && @user.save
            redirect_to runner_path(@runner)
        else
            render 'edit'
        end
    end

    def destroy
        @runner.destroy
        redirect_to root_path
    end

    private

    def set_runner
        @runner = Runner.find(params[:id])
    end

    def runner_params
        params.require(:runner).permit(:name, :age, :height, :weight, :shoe_size, {runner_attributes: [:username]})
    end
end
