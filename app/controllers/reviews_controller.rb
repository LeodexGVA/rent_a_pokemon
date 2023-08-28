class ReviewsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @review.pokemon = @pokemon
    if @review.save
      redirect_to @pokemon, notice: "Review was successfully created."
    else
      render 'pokemons/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @pokemon = @review.pokemon
    @review.destroy
    redirect_to @pokemon, notice: "Review was successfully destroyed."
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
