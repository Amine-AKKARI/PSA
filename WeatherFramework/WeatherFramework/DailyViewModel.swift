//
//  File.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation

public struct DailyViewModel {
    var date = ""
    var tempMin = ""
    var tempMax = ""
    var weather: [WeatherViewModel]!
    
    init (daily: Daily) {
        self.date = createDateFrom(daily.dt)
        self.tempMin = createTempFrom(daily.temp.min)
        self.tempMax = createTempFrom(daily.temp.max)
        self.weather = createWeatherFrom(daily.weather)
        
    }
    
    private func createDateFrom(_ dt: Double) -> String {
        let formattedTimeInterval = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: formattedTimeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let str = dateFormatter.string(from: date)
        return dateFormatter.string(from: date)
    }
    
    private func createTempFrom(_ temp: Float) -> String {
        let rouded = Int(temp.rounded())
        return "\(rouded)°"
    }
    
    private func createWeatherFrom(_ weather: [Weather]) -> [WeatherViewModel] {
        var weatherViewModels = [WeatherViewModel]()
        for weather in weather {
            let weatherViewModel = WeatherViewModel(weather: weather)
            weatherViewModels.append(weatherViewModel)
        }
        return weatherViewModels
    }
    
}
