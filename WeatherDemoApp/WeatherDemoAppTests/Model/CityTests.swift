//
//  CityTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/17/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import WeatherDemoApp

class CityTests: XCTestCase {

    var cities = [City]()
    
    override func setUpWithError() throws {
       let city1 = City(name: "Paris", latitude:48.8566 , longitude: 2.3518)
       let city2 = City(name: "London", latitude:51.5098 , longitude: -0.1180)
        cities = [city1 , city2]
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testCity_WhenAddCity_ThenCityAddedToUserDefault () {
        City.saveCities(cities: cities)
        XCTAssertEqual(City.cities?.count, 2)
    }

}
