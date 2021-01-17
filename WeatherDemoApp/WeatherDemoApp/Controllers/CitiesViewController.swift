//
//  ViewController.swift
//  WeatherDemoApp
//
//  Created by Amine on 1/16/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit
import WeatherFramework

class CitiesViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    @IBOutlet var tableview: UITableView!
    var cities = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let addCityButton = UIBarButtonItem(title: "Add City", style: .plain, target: self, action: #selector(AddCity))
        self.navigationItem.rightBarButtonItem  = addCityButton
    }
    
    @objc func AddCity (){
        coordinator?.presentSelectCityVC()
    }
}

// MARK: - TableView data source

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CityCell
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - AddCityDelegate
extension CitiesViewController: AddCityDelegate {
    func didAddCity(city: City) {
        cities.append(city)
        tableview.reloadData()
    }
}

