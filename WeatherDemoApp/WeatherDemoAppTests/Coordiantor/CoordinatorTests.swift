//
//  CoordinatorTests.swift
//  WeatherDemoAppTests
//
//  Created by Amine on 1/17/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import XCTest
@testable import WeatherDemoApp

class CoordinatorTests: XCTestCase {
    var coordinator: MainCoordinator!

    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_TopViewController_WhenApplicationLaunched_ThenCitiesViewControllerPushed () {
        coordinator.start()
          RunLoop.current.run(until: Date())
        guard let _ =  coordinator.navigationController.topViewController as? CitiesViewController else {
              XCTFail()
              return
          }
    }
    
    func test_TopViewController_whenAddcity_ThenSelectCityViewControllerPresented () {
        coordinator.start()
        coordinator.presentSelectCityVC()
        RunLoop.current.run(until: Date())
        guard coordinator.presenter.presentedViewController != coordinator.presenter else {
            XCTFail()
            return
        }
    }
    
    func test_TopViewController_WhenSelectCityVC_ThenDetailWeatherVCPushed () {
        let city = City(name: "Paris", latitude: 48.8566, longitude: 2.3518)
        coordinator.showAdDetailWeatherVCForCity(city)
        guard let _ =  coordinator.navigationController.topViewController as? DetailWeatherViewController else {
            XCTFail()
            return
        }
    }
}

