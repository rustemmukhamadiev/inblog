class ArticlePolicy < ApplicationPolicy
  def owner?
    record.user == user
  end
end
