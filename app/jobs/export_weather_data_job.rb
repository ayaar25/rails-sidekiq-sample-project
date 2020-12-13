class ExportWeatherDataJob < ApplicationJob
  queue_as :default

  retry_on RuntimeError, queue: :default, attempts: 3

  def perform
    request = HttpRequest.new(Figaro.env.OPEN_WEATHER_BASE_URL)

    params = {
      lat: -6.2,
      lon: 106.8,
      cnt: 50,
      appid: Figaro.env.OPEN_WEATHER_API_KEY
    }

    weather_cities = request.get(Figaro.env.OPEN_WEATHER_URL, params)

    unless weather_cities.nil?
      weather_cities.each do |weather_city|
        existing_weather_city = Weather.find_by_id(weather_city['id'])

        if existing_weather_city
          existing_weather_city.update(city: weather_city['name'], weather: weather_city['weather'].first['main'], temperature: weather_city['main']['temp'])
        else
          Weather.create(id: weather_city['id'], city: weather_city['name'], weather: weather_city['weather'].first['main'], temperature: weather_city['main']['temp'])
        end
      end
    end

    raise 'Unable to fetch weather data'
  end
end
