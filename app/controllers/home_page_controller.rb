class HomePageController < ApplicationController
  def index
    @chinese_posts = ChinesePost.all
  end
end
