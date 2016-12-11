class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_categories_for_menu

  private

  def set_categories_for_menu
    @categories = Category.all
  end
end
