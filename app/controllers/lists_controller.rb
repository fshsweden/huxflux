require 'pp'

class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @user = User.find(params[:user_id])
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @user = User.find(params[:user_id])
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    @user = User.find(params[:user_id])
    
  end

  # POST /lists
  # POST /lists.json
  def create

    puts "============================ CREATE ==========================="
    puts "============================ CREATE ==========================="
    puts "============================ CREATE ==========================="
    puts "============================ CREATE ==========================="
    puts "============================ CREATE ==========================="
    puts "============================ CREATE ==========================="

    #list[:user_id]
    #list[:listname]

    @user = User.find(params[:user_id])
    cleaned_params = list_params



    puts "============================ RAW ==========================="
    pp params

    puts "============================ UNCLEANED ==========================="
    pp list_params

    puts "============================ CLEANED ==========================="
    pp cleaned_params
    puts "============================ CLEANED ==========================="
    @list = List.new(cleaned_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to [@user, @list], notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    @user = User.find(params[:user_id])
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @user = User.find(params[:user_id])
      @list = @user.lists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id, :listname)
    end
end
