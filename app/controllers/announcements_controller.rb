class AnnouncementsController < ApplicationController
  include EmployeeAsParent

  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  def index
    @search = Announcement.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  def show
  end

  def new
    @announcement = @parent.announcements.build
  end

  def edit
  end

  def create
    @announcement = @parent.announcements.build(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to employee_announcements_path(@parent), notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @announcement] }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to [@parent, @announcement], notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @announcement] }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to employee_announcements_path(@parent), notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:title, :body)
    end
end
