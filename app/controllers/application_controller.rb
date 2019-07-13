class ApplicationController < ActionController::Base
	before_action :set_search

#def set_search
  #@search = Article.search(params[:q])
  #@search = Article.ransack(params[:q]) #ransackメソッド推奨
  #@search_articles = @search.result.page(params[:page])
end

end
