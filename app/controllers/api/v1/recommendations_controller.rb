class Api::V1::RecommendationsController < ApplicationController
  def index
    recommendations = Recommendation.all
    render json: recommendations
  end

  def create
    recommendation = Recommendation.new(
      title: params[:title],
      author: params[:author],
      review: params[:review]
    )

    if recommendation.save
      render json: recommendation, status: :created
    else 
      render json: { errors: recommendation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    recommendation = Recommendation.find(params[:id])

    if recommendation.update(
      title: params[:name] || recommendation.title,
      author: params[:author] || recommendation.author,
      review: params[:review] || recommendation.review
    )
      render json: recommendation
    else
      render json: {errors: recommendation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    recommendation = Recommendation.find(params[:id])
    recommendation.destroy
    render json: { message: 'Recommendation removed from Forum' }, status: :ok
  end

end
