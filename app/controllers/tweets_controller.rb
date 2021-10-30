class TweetsController < ApplicationController
    before_action :logged_in_user, only: [:edit, :destroy, :edit, :update]
    before_action :correct_user,   only: [:destroy, :edit, :update]

    def create
        @tweet = current_user.tweets.build(tweet_params)
        if @tweet.save
            flash[:success] = "投稿 成功 and 完了"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy
        @tweet.destroy
        flash[:success] = "hahaha...あのツイート跡形もなく消え去ったな..."
        redirect_to request.referrer || root_url
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            flash[:success] = "変更を許可・・・完了"
            redirect_to root_url
        else
            render 'edit'
        end
    end

    private

        def tweet_params
            params.require(:tweet).permit(:content)
        end

        def correct_user
            @tweet = current_user.tweets.find_by(id: params[:id])
            if @tweet.nil?
                flash[:danger] = "不正なアクセスだぞ"
                redirect_to root_url
            end
        end
    end

