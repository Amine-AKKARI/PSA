//
//  WeatherDataViewModel.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation
import UIKit

public struct WeatherDataViewModel {
    
    var current: CurrentViewModel
    var daily: [DailyViewModel]!

    init (weatherData: WeatherData) {
        self.current = CurrentViewModel(current: weatherData.current)
        self.daily = createDailyFrom(weatherData.daily)
    }
    
    private func createDailyFrom(_ daily: [Daily]) -> [DailyViewModel] {
        var dailyViewModel = [DailyViewModel]()
        for daily in daily {
            let daily = DailyViewModel(daily: daily)
            dailyViewModel.append(daily)
        }
        return dailyViewModel
    }
}


