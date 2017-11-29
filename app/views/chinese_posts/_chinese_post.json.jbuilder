json.extract! chinese_post, :id, :title, :content, :source, :created_at, :updated_at
json.url chinese_post_url(chinese_post, format: :json)
