class SearchController < ApplicationController
  def index
    @search = Product.find_by(search: params['search'])
  end
end
