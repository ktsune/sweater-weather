class UnsplashSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  set_type :unsplash
  attributes :url
end
