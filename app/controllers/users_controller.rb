class UsersController < ApplicationController
  layout :resolve_layout
  before_action :logged_in_user?, only: [:edit, :avatar]
  include VerificationsHelper

  def new
    if logged_in?
      redirect_to index_path
    end
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user_class = "nav-link active"
    @home_class = ""
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if current_user.update(update_params)
      flash[:success] = "Success!"
      redirect_to current_user
    else
      render :edit
    end
  end

  def password
    respond_to do |format|
      format.js
  end

  def settings
  @user_class = "nav-link active"
  @home_class = ""
    respond_to do |format|
    format.html
    format.js
    end
  end

  def verification
    @verification = Verifications.new
      respond_to do |format|
        format.js
      end
    end
  end

  def avatar
    respond_to do |format|
      format.js
    end
  end

  def upload_avatar
    if current_user.update(avatar_params)
      redirect_to current_user
    end
  end

  def my_comments
    @my_comments = Comment.paginate(page: params[:page], per_page: 3).where(user_id: current_user.id, comment_id: nil)
    @my_comments_to_comments = Comment.paginate(page: params[:page], per_page: 3).where("user_id = ? and comment_id > 0", current_user.id)
  end

  def other_comments
    @comments = Comment.paginate(page: params[:page], per_page: 3).where(post_id: !nil)
    @comments2 = Comment.paginate(page: params[:page], per_page: 3).where(post_id: nil)
  end

  def my_posts
    @my_posts = Post.paginate(page: params[:page], per_page: 5).where(user_id: current_user.id)
  end

  def user_params
    params.require(:user).
    permit(:name,:email,:mobile,:password,:password_confirmation)
  end

  def update_params
    params.require(:user).
    permit(:name,:email,:mobile,:city,:bio,:password,:password_confirmation)
  end

  def avatar_params
    params.require(:user).
    permit(:avatar)
  end

  def resolve_layout
    case action_name
    when "new", "create"
      "form"
    else
      "application"
    end
  end

end
