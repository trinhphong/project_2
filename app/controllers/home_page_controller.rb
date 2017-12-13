class HomePageController < ApplicationController
  def index
    @chinese_posts = ChinesePost.all.order(created_at: :desc)
  end
end
