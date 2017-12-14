class HomePageController < ApplicationController
  def index
    @chinese_posts = ChinesePost.all
                                .paginate(page: params[:page], per_page: 8)
                                .order(created_at: :desc)
  end
end
