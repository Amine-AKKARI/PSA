//
//  WeatherServiceTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/18/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
import WeatherFramework
class WeatherServiceTests: XCTestCase {

    func testWeatherService_WhenLatitudeAndLongiture_ThenGetWeatherResponse () {
        let latitude = 48.8566419
        let longitude = 2.3518481
        let promise = expectation(description: "json returned weatherDataViewModel")
        WeatherService.weatherDataForLocation(latitude: latitude, longitude: longitude) { (weatherDataViewModel, _) in
            guard let _ = weatherDataViewModel else {return}
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
    }
}
