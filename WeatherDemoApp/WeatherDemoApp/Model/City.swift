//
//  City.swift
//  WeatherDemoApp
//
//  Created by Amine on 1/16/21.
//  Copyright © 2021 Amine. All rights reserved.
//

import Foundation

struct City: Codable {
    let name: String
    let latitude: Double
    let longitude: Double
    
    static var cities:[City]? {
        if let objects = UserDefaults.standard.value(forKey: "cities") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [City] {
                return objectsDecoded
            }
            else {
                return nil
            }
        }else {
            return nil
        }
    }
    
    static func saveCities(cities: [City]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cities){
            UserDefaults.standard.set(encoded, forKey: "cities")
        }
    }
    
    static func AlreadyAdded(city: City) -> Bool {
        let added = cities?.filter {addedCity in
            return city.name.lowercased() == addedCity.name.lowercased()
        }
        return (added?.count ?? 0 > 0) ? true : false
    }
}



