class RelationshipsController < ApplicationController

    def create
      @user = User.find(params[:relationship][:follow_id])
      following = current_user.follow(@user)
      if 
        flash[:success] = 'ユーザーをフォローしました'
        redirect_to @user
      else
        flash.now[:alert] = 'ユーザーのフォローに失敗しました'
        redirect_to @user
      end
    end
  
    def destroy
      @user=Relationship.find(params[:id]).follow
      following = current_user.unfollow(@user)
      if following.destroy
        flash[:success] = 'ユーザーのフォローを解除しました'
        redirect_to @user
      else
        flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
        redirect_to @user
      end
    end
  
    private
    def set_user
      # @user = User.find(params[:follow_id])
       @user = User.find(params[:relationship][:follow_id])
    end
  
end
