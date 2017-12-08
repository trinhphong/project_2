module ChinesePostsHelper
  def self.check_rated?(current_user_id, vn_id)
    Rate.where(user_id: current_user_id, vietnamese_phrase_id: vn_id, rated: true).exists?
  end
end
