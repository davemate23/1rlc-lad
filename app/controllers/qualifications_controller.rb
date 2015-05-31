class QualificationsController < ApplicationController
  include EmployeeAsParent

  before_action :set_qualification, only: [:show, :edit, :update, :destroy]

  # GET /qualifications
  # GET /qualifications.json
  def index
    @qualifications = @parent.qualifications
  end

  # GET /qualifications/1
  # GET /qualifications/1.json
  def show
  end

  # GET /qualifications/new
  def new
    @qualification = @parent.qualifications.build
  end

  # GET /qualifications/1/edit
  def edit
  end

  # POST /qualifications
  # POST /qualifications.json
  def create
    @qualification = @parent.qualifications.build(qualification_params)

    respond_to do |format|
      if @qualification.save
        format.html { redirect_to [@parent, @qualification], notice: 'Qualification was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @qualification] }
      else
        format.html { render :new }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qualifications/1
  # PATCH/PUT /qualifications/1.json
  def update
    respond_to do |format|
      if @qualification.update(qualification_params)
        format.html { redirect_to [@parent, @qualification], notice: 'Qualification was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @qualification] }
      else
        format.html { render :edit }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualifications/1
  # DELETE /qualifications/1.json
  def destroy
    @qualification.destroy
    respond_to do |format|
      format.html { redirect_to employee_qualifications_path(@parent), notice: 'Qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualification
      @qualification = @parent.qualifications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualification_params
      params.require(:qualification).permit(:type, :title, :grade, :end_date, :status, :school)
    end
end
