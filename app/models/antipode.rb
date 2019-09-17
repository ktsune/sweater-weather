class Antipode
  attr_reader :summary, :temperature
  def initialize(weather)
    @id = "1"
    @summary = weather.current_summary
    @temperature = weather.current_temperature
  end
end
