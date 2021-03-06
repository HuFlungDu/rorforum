class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  def show
    @user = @query = User.find(params[:id])
  end
  def new
  	@user = @query = User.new
  end
  def create
    @user = @query = User.new(params[:user])
    if @user.save
      sign_in @user, false
      flash[:success] = "User Registered!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = @query = User.find(params[:id])
  end

  def update
    @user = @query = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
	  sign_in @user, session[:persistence]
	  redirect_to @user
    else
      render 'edit'
    end
  end

  def index
  	@users = @query = User.paginate(page: params[:page])
  end

  def signed_in_user
  	store_location
    redirect_to login_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = @query = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
