//
//  WeatherService.swift
//  Pods-WeatherDemoApp
//
//  Created by Amine on 1/17/21.
//

import Foundation

public enum OpenWeatherMapError: Error {
  case invalidResponse
  case noData
  case failedRequest
  case invalidData
}

public class WeatherService {
    
    public init () {}
    
    public typealias WeatherDataCompletion = (WeatherDataViewModel?, OpenWeatherMapError?) -> ()
    
    private static let apiKey = "bff7cffa4f5e24190b8e1922faad7935"
    private static let host = "api.openweathermap.org"
    private static let path = "/data/2.5/onecall"
    private static let units = "metric"
    private static let cache = "max-age=30"
    
    
     public class func weatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataCompletion) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = host
        urlBuilder.path = path
        urlBuilder.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "units", value: units),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "Cache-Control", value: cache)
        ]
        
        let url = urlBuilder.url!
        URLSession.shared.configuration.requestCachePolicy = .returnCacheDataElseLoad
        URLSession.shared.dataTask(with: url, cachedResponseOnError: true) { (data, response, error) in
            //execute completion handler on main thread
            DispatchQueue.main.async {
                guard let data = data else {
                    print("No data returned from Weatherapi")
                    completion(nil, .noData)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    print("Unable to process Weatherapi response")
                    completion(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print("Failure response from Weatherapi: \(response.statusCode)")
                    completion(nil, .failedRequest)
                    return
                }
                
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print ("json : \(json)")
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData: WeatherData = try decoder.decode(WeatherData.self, from: data)
                    let weatherDataViewModel = WeatherDataViewModel(weatherData: weatherData)
                    completion(weatherDataViewModel, nil)
                } catch {
                    print("Unable to decode Weatherapi response: \(error.localizedDescription)")
                    completion(nil, .invalidData)
                }
            }
        }.resume()
    }
}

extension URLSession {
    func dataTask(with url: URL, cachedResponseOnError: Bool, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { (data, response, error) in
            if cachedResponseOnError,
                let error = error,
                let cachedResponse = self.configuration.urlCache?.cachedResponse(for: URLRequest(url: url)) {
                completionHandler(cachedResponse.data, cachedResponse.response, error)
                return
            }
            completionHandler(data, response, error)
        }
    }
}
