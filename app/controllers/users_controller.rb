class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def signin
    render "users/signin", :layout => false
  end

  def taken_up
    @idea = Idea.find(params[:idea_id])
    @idea.update(:taken_up_id => params[:taken_up_id])
    redirect_to root_path
  end

  def login
    if request.post?
      @user, res = User.login(params[:user][:uname], params[:user][:password])
      if @user and res == :success
        session[:uid] = @user.uuid
        redirect_to root_path
      else
        redirect_to signin_path, :alert => "Invalid username or password"
      end
    else
      redirect_to signin_path
    end
  end

  def logout
    session[:is_admin] = nil
    session[:uid] = nil
    session.clear
    flash[:message] = 'Logged out'
    redirect_to signin_path
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    render :layout => false
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to signin_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uuid, :uname, :password, :email, :salt, :is_admin)
    end
end
