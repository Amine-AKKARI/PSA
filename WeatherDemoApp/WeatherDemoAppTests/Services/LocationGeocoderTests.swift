//
//  LocationGeocoderTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/17/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
import WeatherFramework
class LocationGeocoderTests: XCTestCase {
    
    func testLocationGeocoder_WhenAdress_ThenGetCoordinations () {
        LocationGeocoder.getCoordinateFrom(address: "paris"){ coordinate, error in
            XCTAssertNotNil(coordinate)
            XCTAssertEqual(coordinate?.latitude, 48.8566)
            XCTAssertEqual(coordinate?.longitude, 2.3518)
        }
    }
    
    func testLocationGeocoder_WhenWrongAdress_ThenGetError () {
        LocationGeocoder.getCoordinateFrom(address: "aaaa"){ coordinate, error in
            XCTAssertNotNil(error)
        }
    }
}
