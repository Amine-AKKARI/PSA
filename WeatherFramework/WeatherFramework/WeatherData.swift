//
//  WeatherData.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation

struct WeatherData: Codable {
    let current: Current
    let daily: [Current]
}

struct Current: Codable {
    let dt: Double
    let weather: [Weather]
}


struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
