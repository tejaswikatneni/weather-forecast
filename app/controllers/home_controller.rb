class HomeController < ApplicationController

	def index
		weather_response = JSON.parse(RestClient.get "http://api.openweathermap.org/data/2.5/forecast?q=Bangalore,in&mode=json&appid=#{API_KEY}")
		forecast_data = {}
		weather_response["list"].each do |data|
			forecast_data[data["dt_txt"]] = (data["main"]["temp"]-273.15).round(2)
		end
		@forecast_data_result = Hash[forecast_data.sort_by {|k,v| v}]
	end
end
