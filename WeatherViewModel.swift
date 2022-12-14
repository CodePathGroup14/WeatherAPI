//
//  WeatherViewModel.swift
//  testing22
//
//  Created by Raghavendra Raikar on 11/6/22.
//

import Foundation

private let defaultIcon = "â"
private let iconMap = [
    "Drizzle" : "đ§ī¸",
    "Thunderstorm" : "đŠī¸",
    "Rain" : "đ§ī¸",
    "Snow" : "âī¸",
    "Clear": "âī¸",
    "Clouds": "âī¸",

]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData{ weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)*Ö¯ C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
            
        }
    }
}
