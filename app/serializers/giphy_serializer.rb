class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image
end
