module Users
  class ArticlesController < Users::BaseController
    before_action :authenticate_user!, except: %i(index)
    before_action :authorize_user!, only: %i(edit update)

    ARTICLES_PER_PAGE = 10

    expose(:user, finder: :find_by_username, finder_parameter: :username)
    expose_decorated(:user_articles, model: :article, ancestor: :user) { |scope| paginated_articles(scope) }
    expose(:article, attributes: :article_params)

    def index
      respond_with(user_articles, location: username_articles_path)
    end

    def new
    end

    def create
      article.user = current_user
      article.save
      respond_with(article)
    end

    def edit
    end

    def update
      article.save
      respond_with(article)
    end

    private

    def authorize_user!
      authorize(article, :owner?)
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end

    def paginated_articles(scope)
      scope.sorted.page(params[:page]).per(ARTICLES_PER_PAGE)
    end
  end
end
