//
//  CurrentResponseTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/17/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import WeatherFramework

class CurrentResponseTests: XCTestCase {

    func test_CurrentResponse_whenDecode_thenHasCurrentResponse () {
        let data = UtilsTests.jsonData(filename: "CurrentResponseModel")
        do {
            guard let data = data else {return}
            let current = try JSONDecoder().decode(Current.self, from: data)
            XCTAssertEqual(current.dt, 1610917803)
            XCTAssertEqual(current.temp, 4.4)
            XCTAssertEqual(current.weather.count, 1)
            let weather = current.weather[0]
            XCTAssertEqual(weather.id, 804)
            XCTAssertEqual(weather.main, "Clouds")
            XCTAssertEqual(weather.description, "overcast clouds")
            XCTAssertEqual(weather.icon, "04n")
        } catch {
            print(error)
        }
    }
}
