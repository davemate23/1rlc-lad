class NextOfKinsController < ApplicationController
  include EmployeeAsParent

  before_action :set_next_of_kin, only: [:show, :edit, :update, :destroy]

  # GET /next_of_kins
  # GET /next_of_kins.json
  def index
    @search = NextOfKin.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  # GET /next_of_kins/1
  # GET /next_of_kins/1.json
  def show
  end

  # GET /next_of_kins/new
  def new
    @next_of_kin = @parent.next_of_kins.build
  end

  # GET /next_of_kins/1/edit
  def edit
  end

  # POST /next_of_kins
  # POST /next_of_kins.json
  def create
    @next_of_kin = @parent.next_of_kins.build(next_of_kin_params)

    respond_to do |format|
      if @next_of_kin.save
        format.html { redirect_to [@parent, @next_of_kin], notice: 'Next of kin was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @next_of_kin] }
      else
        format.html { render :new }
        format.json { render json: @next_of_kin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /next_of_kins/1
  # PATCH/PUT /next_of_kins/1.json
  def update
    respond_to do |format|
      if @next_of_kin.update(next_of_kin_params)
        format.html { redirect_to [@parent, @next_of_kin], notice: 'Next of kin was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @next_of_kin] }
      else
        format.html { render :edit }
        format.json { render json: @next_of_kin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /next_of_kins/1
  # DELETE /next_of_kins/1.json
  def destroy
    @next_of_kin.destroy
    respond_to do |format|
      format.html { redirect_to employee_next_of_kins_path(@parent), notice: 'Next of kin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_next_of_kin
      @next_of_kin = @parent.next_of_kins.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def next_of_kin_params
      params.require(:next_of_kin).permit(:first_name, :last_name, :address, :contact_number, :relation)
    end
end
