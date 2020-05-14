class UsersController < ApplicationController

    def index
    end

    def show
    end

    def edit
        user = current_user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
    end

    private
    def user_params
        params.require(:user).permit(:id, :last_q, :last_l)
    end

end