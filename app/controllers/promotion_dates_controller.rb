class PromotionDatesController < ApplicationController
  include EmployeeAsParent

  before_action :set_promotion_date, only: [:show, :edit, :update, :destroy]

  def index
    @search = PromotionDate.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  def show
  end

  def new
    @promotion_date = @parent.promotion_dates.build
  end

  def edit
  end

  def create
    @promotion_date = @parent.promotion_dates.build(promotion_date_params)

    respond_to do |format|
      if @promotion_date.save
        format.html { redirect_to @parent, notice: 'Promotion date was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @promotion_date] }
      else
        format.html { render :new }
        format.json { render json: @promotion_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promotion_date.update(promotion_date_params)
        format.html { redirect_to [@parent, @promotion_date], notice: 'Promotion date was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @promotion_date] }
      else
        format.html { render :edit }
        format.json { render json: @promotion_date.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promotion_date.destroy
    respond_to do |format|
      format.html { redirect_to employee_promotion_dates_path(@parent), notice: 'Promotion date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_promotion_date
      @phone = @parent.promotion_dates.find(params[:id])
    end

    def promotion_date_params
      params.require(:promotion_date).permit(:substantive_rank, :date)
    end
end
