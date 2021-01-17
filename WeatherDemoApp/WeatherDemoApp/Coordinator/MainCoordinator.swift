//
//  MainCoordinator.swift
//  WeatherDemoApp
//
//  Created by Amine on 1/16/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var presenter = CitiesViewController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        presenter  = storyboard.instantiateViewController(withIdentifier: "CitiesVC") as! CitiesViewController
        presenter.coordinator = self
        navigationController.pushViewController(presenter, animated: false)
    }
    
    func presentSelectCityVC() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: SelectCityViewController = storyboard.instantiateViewController(withIdentifier: "SelectCityVC") as! SelectCityViewController
        vc.delegate = presenter
        vc.coordinator = self
        let navController = UINavigationController(rootViewController: vc)
        presenter.present(navController, animated:true, completion: nil)
    }
    /**
    Dismiss View Controller
    - Parameter vc: UIViewController ViewController to dismiss
    */
    func dismissSelectCityVC (vc: UIViewController ) {
        vc.dismiss(animated: true, completion: nil)
    }
    
    /**
     Show AdDetailsViewController
     - Parameter adViewModel: adViewModel
     */
    func showAdDetailWeatherVCForCity (_ city: City) {
        let vc = DetailWeatherViewController()
        vc.city = city
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

