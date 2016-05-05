class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :permission_check, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def permission_check
    redirect_to reviews_path, notice: "권한이 없습니다." \
      unless @review.editable?(current_user)
  end

  def review_params
    params.require(:review).permit(:title, :body, :content_title,
                                   :content_episode, :level)
  end
end
