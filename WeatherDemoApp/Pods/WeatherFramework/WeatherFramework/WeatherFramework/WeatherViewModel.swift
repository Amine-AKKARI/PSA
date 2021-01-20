//
//  WeatherViewModel.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation
public struct WeatherViewModel {
    public let id:Int
    public let main: String
    public let description: String
    public let icon: UIImage?
    
    init (weather: Weather) {
        self.id = weather.id
        self.main = weather.main
        self.description = weather.description
        self.icon = UIImage(named: weather.icon)
    }
}
