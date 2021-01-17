//
//  SelectCityViewController.swift
//  WeatherDemoApp
//
//  Created by Amine on 1/16/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit
import WeatherFramework
import CoreLocation

protocol AddCityDelegate: class {
    func didAddCity (city: City)
}

class SelectCityViewController: UIViewController {
    
    @IBOutlet var cityNameTextField: UITextField!
    weak var coordinator: MainCoordinator?
    weak var delegate: AddCityDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let validateButton = UIBarButtonItem(title: "Validate", style: .plain, target: self, action: #selector(Validate))
        self.navigationItem.rightBarButtonItem  = validateButton
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(Cancel))
        self.navigationItem.leftBarButtonItem  = cancelButton
    }
    
    @objc func Validate (){
        guard let city = cityNameTextField.text else {return}
        LocationGeocoder.getCoordinateFrom(address: city) { coordinate, error in
            guard let coordinate = coordinate, error == nil else {
                let alert = UIAlertController(title: "", message: "Please enter a correct city name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            let city = City(name: city, latitude: coordinate.latitude, longitude: coordinate.longitude)
            DispatchQueue.main.async {
                if (City.AlreadyAdded(city: city)) {
                    let alert = UIAlertController(title: "", message: "This city has already been added", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    self.delegate?.didAddCity(city: city)
                    self.coordinator?.dismissSelectCityVC(vc: self)
                }
            }
        }
    }
    
    @objc func Cancel (){
        self.coordinator?.dismissSelectCityVC(vc: self)
    }
}


