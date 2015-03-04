//
//  WeatherDataParser.swift
//  Weather
//
//  Created by Damodar on 28/02/15.
//  Copyright (c) 2015 itsdamslife. All rights reserved.
//

import UIKit

// All temparature units are in Kelvin, subtract 273.15 to convert to Celsius
// humidity in %
//

class WeatherDataParser: NSObject {
    override init() {
        super.init()
    }
    
    func parseData(data: NSData!) -> (city: City, weatherForecast: [Weather]) {
        
//        let path = NSBundle.mainBundle().pathForResource("sampleData", ofType: "") as String! // TODO: - Temp hardcoded
//        var dataFromFile = NSData(contentsOfFile: path!, options: .DataReadingMappedAlways, error: nil) as NSData!

        var responseData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary!
        
        var cityDetails: City = City()
        
        var forecastData:[Weather] = []
        
        if var res = responseData {
            
            let resCode = responseData["cod"] as String!
            let responseCode = resCode.toInt()
            if responseCode == 200 {
                
                let cityData: NSDictionary = responseData["city"] as NSDictionary!
                
                
                
                if let id = cityData["id"] as? String {
                    cityDetails.id = id.toInt()!
                }
                else {
                    cityDetails.id = cityData["id"] as Int!
                }
                
                cityDetails.name = cityData["name"] as String!
                cityDetails.country = cityData["country"] as String!
                
                let dataCount = responseData["cnt"] as UInt
                if dataCount > 0 {
                
                    var dataList = responseData["list"] as [NSDictionary!]
                    
                    for eachData in dataList {
                        
                        var weatherDetails = Weather()
                        
                        var mainData = eachData["temp"] as NSDictionary!
                        weatherDetails.temp = mainData["day"] as Double
                        weatherDetails.temp_min = mainData["min"] as Double
                        weatherDetails.temp_max = mainData["max"] as Double
                        
                        weatherDetails.humidity = eachData["humidity"] as Double
                        
                        var weatherDataList = eachData["weather"] as [NSDictionary!]!
                        var weatherData = weatherDataList[0] as NSDictionary!
                        weatherDetails.mainStatus = weatherData["main"] as String!
                        weatherDetails.desc = weatherData["description"] as String!
                        weatherDetails.icon = weatherData["icon"] as String!
                        weatherDetails.weatherId = weatherData["id"] as UInt
                        
                        forecastData.append(weatherDetails)
                    } // END For each weather detail data in list
                    
                } // END If only there is a list of weather details
                
            } // END if only the response code is 200
            
        } // END if only we get a valid response
        
        return (cityDetails, forecastData)
    }
    
}









