class StaticPagesController < ApplicationController
  def home
    @announcements = Announcement.by_created_at
  end

  def help
  end

  def statistics
  end
end
