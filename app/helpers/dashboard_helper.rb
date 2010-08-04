module DashboardHelper
  def freq_percent(frequencies)
    "#{((frequencies.present.size / frequencies.size) * 100).round}%"
  end
end

