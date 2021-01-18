//
//  CurrentViewModelTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/18/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import WeatherFramework

class CurrentViewModelTests: XCTestCase {

    func testCurrentViewModel_WhenInitiatedWithCurrentModel_ThenGetCurrentViewModelResponse () {
        let data = UtilsTests.jsonData(filename: "CurrentResponseModel")
        do {
            guard let data = data else {return}
            let current = try JSONDecoder().decode(Current.self, from: data)
            let currentViewModel = CurrentViewModel(current: current)
            XCTAssertEqual(currentViewModel.date, "17/01/2021 - 22:10")
            XCTAssertEqual(currentViewModel.temp, "4°")
            let weather = currentViewModel.weather[0]
            XCTAssertEqual(weather.id, 804)
            XCTAssertEqual(weather.main, "Clouds")
            XCTAssertEqual(weather.description, "overcast clouds")
            XCTAssertEqual(weather.icon, UIImage(named: "04n"))
            
        } catch {
            print(error)
        }
    }
}
