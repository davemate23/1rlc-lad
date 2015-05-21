class AddressesController < ApplicationController
  include EmployeeAsParent

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = @parent.addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = @parent.addresses.build
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = @parent.addresses.create(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to [@parent, @address], notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @address] }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to [@parent, @address], notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: [@aprent, @address] }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to [@parent, Address], notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = @parent.addresses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:address_type, :street_address, :street_address_2, :town, :county, :country, :post_code)
    end
end
