class DatePickerInput < FormtasticBootstrap::Inputs::DatePickerInput

  def value
    return options[:input_html][:value] if options[:input_html] && options[:input_html].key?(:value)
    val = object.send(method)
    return Date.new(val.year, val.month, val.day).to_s if val.is_a?(Time)
    return val if val.nil?
    val.strftime('%Y-%m-%d')
  end
end
