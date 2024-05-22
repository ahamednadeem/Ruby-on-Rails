#The controller for friends. All the logic for CRUD operations is written here.

class FriendsController < ApplicationController
  # This is the before action when index, show, new or edit operation is requested.
  before_action :set_friend, only: %i[show edit update destroy ]

  # show all users in the table
  def index
    @friends = Friend.all
  end

  def search
    @friends = Friend.where("name LIKE?", "%" + params[:q] + "%")
  end

  #show user details
  def show
  end

  # used to render a form for creating a new friend.
  def new
    @friend = Friend.new
  end

  # used to render a form for editing an existing friend.
  def edit
  end

  # To create a new user in table
  def create
    @friend = Friend.new(friend_params) # A new instance of the friend model is created.

    respond_to do |format|
      if @friend.save  # This saves the data in the table
        format.html { redirect_to friend_url(@friend), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # To update the existing user details
  def update
    respond_to do |format|
      begin
        if @friend.update(friend_params)  # updated the user details
          format.html { redirect_to friend_url(@friend), notice: "Friend was successfully updated." }
          format.json { render :show, status: :ok, location: @friend }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @friend.errors, status: :unprocessable_entity }
        end
      
      end
    end
  end
  

  # Delete the specified user
  def destroy
    @friend.destroy!  # deletes the user

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "User was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions. 
    # This sets the @friend to the current user id
    def set_friend
    begin
      @friend = Friend.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { redirect_to friends_url, notice: "Oops user got Deleted"}
        format.json { head :no_content }
    end
  end
    end

    # Only allow a list of trusted parameters required
    def friend_params
      params.require(:friend).permit(:name, :email, :phone)
    end
end