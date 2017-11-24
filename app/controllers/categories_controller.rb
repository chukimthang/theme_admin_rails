class CategoriesController < ApplicationController
  def index
    per_page = params[:per_page] ? params[:per_page] : Category::DEFAULT_PER_PAGE

    query = Category.order(created_at: :asc)
    @categories = query.page(params[:page]).per(per_page)
    @total_records = query.size
  end

  def destroy
    @category = Category.find(params[:id])

    if @category
      @category.destroy
      flash[:success] = t "view.category.delete_success"
      
      respond_to do |format|
        format.html {redirect_to categories_path}
      end
    end
  end
end
