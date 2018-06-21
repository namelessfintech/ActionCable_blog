class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(id: params[:id])
    @articles = @category.articles
  end

end
