class PhonesController < ApplicationController
  include EmployeeAsParent

  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  # GET /phones
  # GET /phones.json
  def index
    @search = Phone.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  # GET /phones/1
  # GET /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @phone = @parent.phones.build
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    @phone = @parent.phones.build(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to [@parent, @phone], notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @phone] }
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to [@parent, @phone], notice: 'Phone was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @phone] }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to employee_phones_path(@parent), notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = @parent.phones.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:phone_type, :name, :number)
    end
end
