class Antipode
  attr_reader :summary, :temperature
  def initialize(weather)
    @summary = weather.current_summary
    @temperature = weather.current_temp
  end
end
