class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :timezone, :current_temp, :current_summary, :current_time, :current_humidity, :current_uv, :current_visibility, :feels_like, :hourly_precip, :hourly_time, :hourly_temp, :hourly_summary
  set_id :timezone
end
