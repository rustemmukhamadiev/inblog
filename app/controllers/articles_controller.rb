class ArticlesController < ApplicationController
  ARTICLES_PER_PAGE = 10

  expose_decorated(:articles) { |scope| paginated_articles(scope) }
  expose_decorated(:article)

  def index
  end

  def show
  end

  private

  def paginated_articles(scope)
    scope.sorted.with_user.page(params[:page]).per(ARTICLES_PER_PAGE)
  end
end
