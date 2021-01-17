//
//  LocationGeocoder.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/16/21.
//

import Foundation
import CoreLocation

public class LocationGeocoder {
   
    public init () {
        
    }
    
    public class func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
}
