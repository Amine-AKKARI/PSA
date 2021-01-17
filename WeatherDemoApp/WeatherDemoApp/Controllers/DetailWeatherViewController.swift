//
//  DetailWeatherViewController.swift
//  WeatherDemoApp
//
//  Created by Amine on 1/16/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit
import WeatherFramework

class DetailWeatherViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    var city:City! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherService.weatherDataForLocation(latitude: city.latitude, longitude: city.longitude) { (viewModel, error) in
            print ("eeeee")
        }
    }
}
