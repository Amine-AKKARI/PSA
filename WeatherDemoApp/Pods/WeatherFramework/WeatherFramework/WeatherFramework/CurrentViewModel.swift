//
//  CurrentViewModel.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation
public struct CurrentViewModel {
    public var date = ""
    public var temp = ""
    public var weather:[WeatherViewModel]!
    
    init (current: Current) {
        self.date = createDateFrom(current.dt)
        self.temp = createTempFrom(current.temp)
        self.weather = createWeatherFrom(current.weather)
    }
    
    private func createDateFrom(_ dt: Double) -> String {
        let formattedTimeInterval = TimeInterval(dt)
        let date = Date(timeIntervalSince1970: formattedTimeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
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

