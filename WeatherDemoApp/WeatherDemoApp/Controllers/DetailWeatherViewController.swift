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

    @IBOutlet var currentWeatherImageView: UIImageView!
    @IBOutlet var currentWeatherTemp: UILabel!
    @IBOutlet var currentWeatherMain: UILabel!
    @IBOutlet var currentWeatherDate: UILabel!
    
    @IBOutlet var dailyTableView: UITableView!
    weak var coordinator: MainCoordinator?
    var city:City!
    var weatherDataViewModel: WeatherDataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherService.weatherDataForLocation(latitude: city.latitude, longitude: city.longitude) { (weatherDataViewModel, error) in
            guard let weatherDataViewModel = weatherDataViewModel else {return}
            self.weatherDataViewModel = weatherDataViewModel
            self.configureView(weatherDataViewModel: weatherDataViewModel)
        }
    }
    
    func configureView (weatherDataViewModel: WeatherDataViewModel) {
        currentWeatherImageView.image = weatherDataViewModel.current.weather[0].icon
        currentWeatherTemp.text = weatherDataViewModel.current.temp
        currentWeatherMain.text = weatherDataViewModel.current.weather[0].main
        currentWeatherDate.text = weatherDataViewModel.current.date
        dailyTableView.reloadData()
    }
}

// MARK: - TableView data source

extension DetailWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let weatherDataViewModel = weatherDataViewModel {
            return weatherDataViewModel.daily.count
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for: indexPath) as! DailyCell
        cell.configureWith(dailyViewModel: weatherDataViewModel.daily[indexPath.row])
        return cell
    }
}
