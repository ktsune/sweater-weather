class GiphyDarkSkySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :summary, :time, :url, :copyright
end
