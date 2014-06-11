class CommDevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comm_device, only: [:show, :edit, :update, :destroy]

  # GET /comm_devices
  # GET /comm_devices.json
  def index
    @comm_devices = CommDevice.all
  end

  # GET /comm_devices/1
  # GET /comm_devices/1.json
  def show
  end

  # GET /comm_devices/new
  def new
    @comm_device = CommDevice.new
  end

  # GET /comm_devices/1/edit
  def edit
  end

  # POST /comm_devices
  # POST /comm_devices.json
  def create
    @comm_device = CommDevice.new(comm_device_params)

    respond_to do |format|
      if @comm_device.save
        format.html { redirect_to @comm_device, notice: 'Comm device was successfully created.' }
        format.json { render :show, status: :created, location: @comm_device }
      else
        format.html { render :new }
        format.json { render json: @comm_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comm_devices/1
  # PATCH/PUT /comm_devices/1.json
  def update
    respond_to do |format|
      if @comm_device.update(comm_device_params)
        format.html { redirect_to @comm_device, notice: 'Comm device was successfully updated.' }
        format.json { render :show, status: :ok, location: @comm_device }
      else
        format.html { render :edit }
        format.json { render json: @comm_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comm_devices/1
  # DELETE /comm_devices/1.json
  def destroy
    @comm_device.destroy
    respond_to do |format|
      format.html { redirect_to comm_devices_url, notice: 'Comm device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comm_device
      @comm_device = CommDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comm_device_params
      params[:comm_device]
    end
end
