class UsersController < ApplicationController
  require 'securerandom'
  require 'bcrypt'
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index

    @users = User.joins(:assign_staffs).where("assign_staffs.parent_id=?",current_user.id)
    #@users = User.owner_staff(current_user.id)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @layout = set_layout
    if @layout == "owner"
      @user = current_user
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    password = SecureRandom.hex(4)
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    @user.password = password_hash
    @role = Role.find_by_name("staff_member")
    @user.role_id = @role.id
    respond_to do |format|
      if @user.save
        @assign_staff  = AssignStaff.new
        @assign_staff.user_id = @user.id
        @assign_staff.parent_id = current_user.id
        if @assign_staff.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
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
      params.require(:user).permit!
    end
end
