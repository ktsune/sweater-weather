class CoordinatesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lat, :long
  set_type :coordinates
  set_id :lat
end
