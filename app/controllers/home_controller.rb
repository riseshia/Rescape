class HomeController < ApplicationController
  def index
    @reviews = Review.recent(10)
  end
end
