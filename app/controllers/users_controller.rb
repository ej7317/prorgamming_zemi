class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :delete]
  before_action :correct_user,   only: [:edit, :update]

   def show
     @user = User.find(params[:id])
     @tweets = @user.tweets
   end

   def new
      @user = User.new
   end  

   def create
     @user = User.new(user_params)  
     if @user.save
       log_in @user
       redirect_to @user# 保存の成功をここで扱う。
     else
       render 'new'
     end
   end

   def destroy
    @user.destroy
    redirect_to root_url
   end

   def edit
    @user = User.find(params[:id])
   end
   
   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "フォロー中"
    @user = User.find(params[:id])
    @users = @user.following_user.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー達"
    @user = User.find(params[:id])
    @users = @user.follower_user.paginate(page: params[:page])
    render 'show_followers'
  end

  def likes
    @title = "いいね欄"
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
    @users = @user.liked_tweets.order(created_at: "DESC").paginate(page: params[:page])
    render 'liked_tweets'
  end

  private
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end