class SuggestionsController < ApplicationController
  include EmployeeAsParent

  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  def index
    @search = Suggestion.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  def show
  end

  def new
    @competency = @parent.suggestions.build
  end

  def edit
  end

  def create
    @suggestion = @parent.suggestions.build(suggestion_params)

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to root_path, notice: 'Suggestion was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @suggestion] }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to [@parent, @suggestion], notice: 'Suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @suggestion] }
      else
        format.html { render :edit }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to employee_suggestions_path(@parent), notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_suggestion
      @competency = Suggestion.find(params[:id])
    end

    def suggestion_params
      params.require(:suggestion).permit(:title, :body)
    end
end
