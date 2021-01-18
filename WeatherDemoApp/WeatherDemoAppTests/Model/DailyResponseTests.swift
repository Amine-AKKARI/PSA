//
//  DailyResponseTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/17/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import WeatherFramework
class DailyResponseTests: XCTestCase {

    func test_DailyResponse_whenDecode_thenHasDailyResponse () {
        let data = UtilsTests.jsonData(filename: "DailyResponseModel")
        do {
            guard let data = data else {return}
            let dailies = try JSONDecoder().decode([Daily].self, from: data)
            let daily = dailies[0]
            XCTAssertEqual(daily.dt, 1610884800)
            XCTAssertEqual(daily.temp.min, 3.06)
            XCTAssertEqual(daily.temp.max, 6.55)
            let weather = daily.weather[0]
            XCTAssertEqual(weather.id, 500)
            XCTAssertEqual(weather.main, "Rain")
            XCTAssertEqual(weather.description, "light rain")
            XCTAssertEqual(weather.icon, "10d")
            
            
            
        } catch {
            print(error)
        }
    }

}
