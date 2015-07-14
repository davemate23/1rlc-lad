if Rails.env.production?
  Airbrake.configure do |config|
    config.api_key = 'a53add90239b41dadadd10c19739540a'
  end
end
