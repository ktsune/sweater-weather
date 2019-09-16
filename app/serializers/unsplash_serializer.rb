class UnsplashSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :url
  set_type :unsplash 
  set_id :url
end
