//
//  WeatherDataViewModel.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation

public struct WeatherDataViewModel {
    
    var current: CurrentViewModel
    var daily: [CurrentViewModel]!

    init (weatherData: WeatherData) {
        self.current = CurrentViewModel(current: weatherData.current)
        self.daily = createDailyFrom(weatherData.daily)
    }
    
    private func createDailyFrom(_ daily: [Current]) -> [CurrentViewModel] {
        var dailyViewModel = [CurrentViewModel]()
        for current in daily {
            let daily = CurrentViewModel(current: current)
            dailyViewModel.append(daily)
        }
        return dailyViewModel
    }
}

public struct CurrentViewModel {
    var date = ""
    var weather: [WeatherViewModel]!
    
    init (current: Current) {
        self.date = createDateFrom(current.dt)
        self.weather = createWeatherFrom(current.weather)
    }
    
    private func createDateFrom(_ dt: Double) -> String {
        let formattedTimeInterval = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: formattedTimeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let str = dateFormatter.string(from: date)
        return dateFormatter.string(from: date)
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

public struct WeatherViewModel {
    let id:Int
    let main: String
    let description: String
    let icon: UIImage?
    
    init (weather: Weather) {
        self.id = weather.id
        self.main = weather.main
        self.description = weather.description
        self.icon = UIImage(named: weather.icon)
    }
}
