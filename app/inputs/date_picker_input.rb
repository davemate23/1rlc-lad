class DatePickerInput < FormtasticBootstrap::Inputs::DatePickerInput

  def value
    val = object.send(method)
    val.strftime('%d/%m/%Y') if val.present?
  end
end
