
WeatherFramework is a framework that allow users to convert city names into coordinates (latitude and logitude) then use them to get weather informations for the appropriate location using the openweathermap API.


Getting Started
===============
## Installation

Start by installing WeatherFramework using Cocoapods by simply adding this line to your Podfile:


```
pod 'WeatherFramework', :git => 'https://github.com/Amine-AKKARI/PSA.git'
```

## Requirements
* iOS 11 or later


Using WeatherFramework
===============

Once you get the framework using CocoaPods you can use it in your application by importing WeatherFramework using  :

```import WeatherFramework```  in your ViewController

#### Convert city name to coordinates

the WeatherFramework allows you to convert city name into latitude and longitude calling the  ```LocationGeocoder```

``` 
LocationGeocoder.getCoordinateFrom(address: city) { coordinate, error in
    guard let coordinate = coordinate, error == nil else {
        return
    }
    // Do work using the coordinate as CLLocationCoordinate2D
  }
  
```

#### Get weather Informations for city name

Once you have the latitude and longitude of a city you get weather informations for this city calling the  ```WeatherService```

``` 
WeatherService.weatherDataForLocation(latitude: city.latitude, longitude: city.longitude) { (weatherDataViewModel, error) in
    guard let weatherDataViewModel = weatherDataViewModel else {return}
    // Do work with the weatherDataViewModel
  }
  
```

The  ```WeatherDataViewModel``` is a struct containing   ``` public var current```  as ```CurrentViewModel``` representing the current weather and  ``` public var daily``` as  ```[DailyViewModel]``` representing a list of daily weather informations.

