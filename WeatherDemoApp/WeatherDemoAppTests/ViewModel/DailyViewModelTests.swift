//
//  DailyViewModelTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/18/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import WeatherFramework

class DailyViewModelTests: XCTestCase {

    func testDailyViewModel_WhenInitiatedWithDailyModel_ThenGetDailyViewModelResponse () {
        let data = UtilsTests.jsonData(filename: "DailyResponseModel")
        do {
            guard let data = data else {return}
            let dailies = try JSONDecoder().decode([Daily].self, from: data)
            let daily = dailies[0]
            let dailyViewModel = DailyViewModel(daily: daily)
            XCTAssertEqual(dailyViewModel.date, "17/01/2021")
            XCTAssertEqual(dailyViewModel.tempMin, "3°")
            XCTAssertEqual(dailyViewModel.tempMax, "7°")
            let weatherViewModel = dailyViewModel.weather[0]
            XCTAssertEqual(weatherViewModel.id, 500)
            XCTAssertEqual(weatherViewModel.main, "Rain")
            XCTAssertEqual(weatherViewModel.description, "light rain")
            XCTAssertEqual(weatherViewModel.icon, UIImage(named: "10d"))
        } catch {
            print(error)
        }
    }

}
