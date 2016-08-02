module Users
  class ArticlesController < Users::BaseController
    before_action :authorize_user!, only: %i(edit update)

    expose(:article, attributes: :article_params)

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
  end
end
