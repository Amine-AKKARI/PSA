//
//  WeatherData.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation

struct WeatherData: Codable {
    let current: Current
    let daily: [Daily]
}

struct Current: Codable {
    let dt: Double
    let temp:Float
    let weather: [Weather]
}

struct Daily: Codable {
    let dt: Double
    let temp: Temperature
    let weather: [Weather]
}

struct Temperature: Codable {
    let min: Float
    let max: Float
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
