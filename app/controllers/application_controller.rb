class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_inquiry, :old_to_new_links
  layout :determine_layout

  def determine_layout
    if home_page?
      "home"
    elsif controller_name == "accommodations"
      "accommodations"
    elsif controller_name == "locations"
      "locations"
    elsif controller_name == "activities"
      "activities"
    elsif controller_name == "posts"
      "blogs"
    elsif controller_name == "categories" and action_name == "show"
      "blogs"
    else
      "application"
    end
  end

  def old_to_new_links
    @back_links = Refinery::BackLinks::BackLink.where(:old_link => request.fullpath).first
    if @back_links.present? and @back_links.new_link.present?
      redirect_to "#{@back_links.new_link}", :status => 301
    end
  end


  def get_inquiry
    if session[:inquiry].present?
      @inquiry = session[:inquiry]
      session[:inquiry] = nil
    end
  end
end
